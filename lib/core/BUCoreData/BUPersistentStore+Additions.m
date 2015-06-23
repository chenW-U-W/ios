//
//  BUPersistentStore+Additions.m
//  Flotsm
//
//  Created by Neil Edwards on 04/11/2014.
//  Copyright (c) 2014 mohawk. All rights reserved.
//

#import "BUPersistentStore+Additions.h"
#import "BUPersistentStore.h"

@implementation BUPersistentStore (Additions)


- (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    
    // execute
    NSArray *ret = [self.managedObjectContext executeFetchRequest:request error:error];
    
    return ret;
}

- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    [request setPredicate:predicate];
    
    // execute
    return [self.managedObjectContext executeFetchRequest:request error:error];
}

- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    [request setPredicate:predicate];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    // execute
    return [self.managedObjectContext executeFetchRequest:request error:error];
}

- (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    // execute
    return [self.managedObjectContext executeFetchRequest:request error:error];
}



- (NSArray *)oneForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error{
    
     NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    [request setFetchLimit:1];
    
    return [self.managedObjectContext executeFetchRequest:request error:error];
    
}

-(NSArray*)allForFetchRequest:(NSFetchRequest*)fetchRequest error:(NSError **)error{
    
    if(fetchRequest==nil)
        return nil;
    
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:error];
    
}



- (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    
    // execute
    NSArray *values = [self.managedObjectContext executeFetchRequest:request error:error];
    
    if (values.count > 0) {
        // this method is designed for accessing a single object, but if there's more just give the first
        return (NSManagedObject *)[values objectAtIndex:0];
    }
    
    return nil;
}

- (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSObject *)value error:(NSError **)error {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setPredicate:predicate];
    
    // entity
    [request setEntity:[self entityDescriptionForEntity:entityName]];
    
    // execute
    NSArray *values = [self.managedObjectContext executeFetchRequest:request error:error];
    
    if (values.count > 0) {
        // this method is designed for accessing a single object, but if there's more just give the first
        return (NSManagedObject *)[values objectAtIndex:0];
    }
    
    return nil;
}



- (NSManagedObject *)entityByObjectID:(NSManagedObjectID *)oid {
    if (oid) {
        return [self.managedObjectContext objectWithID:oid];
    }
    
    return nil;
}

- (NSManagedObject *)createNewEntityByName:(NSString *)entityName {
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.managedObjectContext];
}

- (void)removeEntity:(NSManagedObject *)entity {
    @try {
        [self.managedObjectContext deleteObject:entity];
    } @catch(id exception) {}
}

/* Remove all objects of an entity. */
- (void)removeAllEntitiesByName:(NSString *)entityName {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID, this is quicker
    
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects){
        [self.managedObjectContext deleteObject:object];
    }
    
    error = nil;
    [self fastSave];
}

- (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName {
    return [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
}

@end
