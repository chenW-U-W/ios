//
//  NSManagedObject+BUCoreData.m
//  Flotsm
//
//  Created by Neil Edwards on 04/11/2014.
//  Copyright (c) 2014 mohawk. All rights reserved.
//

#import "NSManagedObject+BUCoreData.h"
#import "BUPersistentStore+Additions.h"

@implementation NSManagedObject (BUCoreData)

+ (id)create {
    return [self createInStore:[BUPersistentStore mainStore]];
}

+ (id)createInStore:(BUPersistentStore *)store {
    return [store createNewEntityByName:NSStringFromClass(self.class)];
}

+ (NSArray *)all {
    return [self allInStore:[BUPersistentStore mainStore]];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate {
    return [self allForPredicate:predicate inStore:[BUPersistentStore mainStore]];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending {
    return [self allForPredicate:predicate orderBy:key ascending:ascending inStore:[BUPersistentStore mainStore]];
}

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending {
    return [self allOrderedBy:key ascending:ascending inStore:[BUPersistentStore mainStore]];
}

+ (NSArray *)allInStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store allForEntity:NSStringFromClass(self.class) error:&error];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate inStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store allForEntity:NSStringFromClass(self.class) predicate:predicate error:&error];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending inStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store allForEntity:NSStringFromClass(self.class) predicate:predicate orderBy:key ascending:ascending error:&error];
}

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending inStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store allForEntity:NSStringFromClass(self.class) orderBy:key ascending:ascending error:&error];
}




+ (id)first {
    return [self firstInStore:[BUPersistentStore mainStore]];
}

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value {
    return [self firstWithKey:key value:value inStore:[BUPersistentStore mainStore]];
}

+ (id)firstInStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store entityByName:NSStringFromClass(self.class) error:&error];
}

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value inStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store entityByName:NSStringFromClass(self.class) key:key value:value error:&error];
}

+ (id)oneForPredicate:(NSPredicate*)predicate orderBy:(NSString *)key ascending:(BOOL)ascending inStore:(BUPersistentStore *)store {
    NSError *error = nil;
    return [store oneForEntity:NSStringFromClass(self.class) predicate:predicate orderBy:key ascending:ascending error:&error];
}



- (void)destroy {
    [[BUPersistentStore mainStore] removeEntity:self];
}

+ (void)destroyAll {
    return [self destroyAllInStore:[BUPersistentStore mainStore]];
}

+ (void)destroyAllInStore:(BUPersistentStore *)store {
    return [store removeAllEntitiesByName:NSStringFromClass(self.class)];
}

@end
