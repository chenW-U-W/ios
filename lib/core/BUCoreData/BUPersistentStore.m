//
//  BUPersistentStore.m
//  Flotsm
//
//  Created by Neil Edwards on 04/11/2014.
//  Copyright (c) 2014 mohawk. All rights reserved.
//

#import "BUPersistentStore.h"
#import "GlobalUtilities.h"


static BUPersistentStore *mainStoreInstance;

NSString *const BUPersistentStoreDidInitialize=@"BUPersistentStoreDidInitialize";

@interface BUPersistentStore()

@property (nonatomic, strong, readwrite) NSManagedObjectContext         *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext                    *writerObjectContext;
@property (nonatomic, strong) NSURL                                     *storeURL;
@property (nonatomic, strong) NSPersistentStoreCoordinator              *storeCordinator;
@property (nonatomic, strong) NSManagedObjectModel                      *model;

@end

@implementation BUPersistentStore


+ (BUPersistentStore *)mainStore {
    @synchronized (self) {
        if (!mainStoreInstance) {
            mainStoreInstance = [[BUPersistentStore alloc] init];
            
        }
    }
    
    return mainStoreInstance;
}


-(void)listNotifications{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managedObjectContextDidUpdate:) name:NSManagedObjectContextDidSaveNotification object:_managedObjectContext];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managedObjectContextDidUpdate:) name:NSManagedObjectContextDidSaveNotification object:_managedObjectContext];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managedObjectContextDidUpdate:) name:NSManagedObjectContextObjectsDidChangeNotification object:_managedObjectContext];
    
}



- (void)managedObjectContextDidUpdate:(NSNotification *)notification {
    

    if([notification.name isEqualToString:NSManagedObjectContextObjectsDidChangeNotification]){
        
        #if defined (CONFIGURATION_Debug)
        
        NSDictionary *userInfo=notification.userInfo;
        
        NSSet *insertedObjects=[userInfo objectForKey:NSInsertedObjectsKey];
        NSSet *deletedObjects=[userInfo objectForKey:NSDeletedObjectsKey];
        NSSet *updatedObjects=[userInfo objectForKey:NSUpdatedObjectsKey];
        
        BetterLog(@"insertedObjects.count=%lu",(unsigned long)insertedObjects.count);
        BetterLog(@"deletedObjects.count=%lu",(unsigned long)deletedObjects.count);
        BetterLog(@"updatedObjects.count=%lu",(unsigned long)updatedObjects.count);
        
        #endif
        
    }
    
    
    
}


- (BOOL)setupWithStoreName:(NSString *)storeName modelName:(NSString *)modelName{
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:modelName withExtension:@"momd"];
    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    
    NSString *storeLocation = [DOCUMENTS_DIR stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
    self.storeURL = [NSURL fileURLWithPath:storeLocation];
    
    /* For extension/watch use
    NSURL *storeURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.flotsmcontainer"];
    self.storeURL  = [storeURL URLByAppendingPathComponent:@"CoreDataStore.sqlite"];
     */
    
    return [self setupPersistenceStack];
    
}


-(BOOL)setupPersistenceStack{
    
    NSError *error = nil;
    
    // create the global persistent store
    self.storeCordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    
    
    // see if model needs migrating
    NSDictionary *sourceMetadata = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType
                                                                                              URL:_storeURL
                                                                                            error:&error];
    
    if (sourceMetadata == nil) {
        // deal with error
    }
    
    NSString *configuration = nil;
    BOOL pscCompatibile = [_model isConfiguration:configuration compatibleWithStoreMetadata:sourceMetadata];
    
    
    //
    // if migration is required
    if (pscCompatibile==YES) {
        
        BetterLog(@"CDS No Migration required");
        
        [_storeCordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:_storeURL options:nil error:&error];
        
        
    }else{
        
        BetterLog(@"CDS migration required, attempting automatic");
        
        NSDictionary *persistentStoreOptions = @{ // Light migration
                                                 NSInferMappingModelAutomaticallyOption:@YES,
                                                 NSMigratePersistentStoresAutomaticallyOption:@YES
                                                 };
        
        NSPersistentStore *persistentStore=[_storeCordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:_storeURL options:persistentStoreOptions error:&error];
        
        if (persistentStore==nil) {
            
            NSError *persistentStoreError;
            NSError *removeSQLiteFilesError = nil;
            if ([self removeSQLiteFilesAtStoreURL:self.storeURL error:&removeSQLiteFilesError]) {
                
                persistentStoreError = nil;
                persistentStore = [_storeCordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                           configuration:nil
                                                                                     URL:self.storeURL
                                                                                 options:persistentStoreOptions
                                                                                   error:&persistentStoreError];
            } else {
                
                BetterLog(@"ERROR: Could not remove SQLite files\n%@", [removeSQLiteFilesError localizedDescription]);
                
                return NO;
            }
            
            if (persistentStore == nil) {
                
                // Something really bad is happening
                BetterLog(@"ERROR: NSPersistentStore is nil: %@\n%@", [persistentStoreError localizedDescription], [persistentStoreError userInfo]);
                
                return NO;
            }
            
            
        }else{
            
            BetterLog(@"CDS migration completed");
            
        }
        
    }
    
    
    // Create managed object contexts
    self.writerObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [self.writerObjectContext setPersistentStoreCoordinator:_storeCordinator];
    if (self.writerObjectContext == nil) {
        
        // App is useless if a writer managed object context cannot be created
        BetterLog(@"ERROR: NSManagedObjectContext is nil");
        
        return NO;
    }
    
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [self.managedObjectContext setParentContext:self.writerObjectContext];
    if (self.managedObjectContext == nil) {
        
        // App is useless if a managed object context cannot be created
        BetterLog(@"ERROR: NSManagedObjectContext is nil");
        
        return NO;
    }

    
    [self listNotifications];
    
    [self persistenceStackInitialized];
    
    return YES;
    
}



#pragma mark - File I/O

- (BOOL)removeSQLiteFilesAtStoreURL:(NSURL *)storeURL error:(NSError * __autoreleasing *)error {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *storeDirectory = [storeURL URLByDeletingLastPathComponent];
    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtURL:storeDirectory
                                          includingPropertiesForKeys:nil
                                                             options:0
                                                        errorHandler:nil];
    
    NSString *storeName = [storeURL.lastPathComponent stringByDeletingPathExtension];
    for (NSURL *url in enumerator) {
        
        if ([url.lastPathComponent hasPrefix:storeName] == NO) {
            continue;
        }
        
        NSError *fileManagerError = nil;
        if ([fileManager removeItemAtURL:url error:&fileManagerError] == NO) {
            
            if (error != NULL) {
                *error = fileManagerError;
            }
            
            return NO;
        }
    }
    
    return YES;
}


-(void)fastSave{
    
    [self saveContextAndWait:YES completion:nil];
    
}


#pragma mark - Context saving

- (void)saveContextAndWait:(BOOL)wait completion:(void (^)(NSError *error))completion {
    
    if (self.managedObjectContext == nil) {
        return;
    }
    
    if ([self.managedObjectContext hasChanges] || [self.writerObjectContext hasChanges]) {
        
        [self.managedObjectContext performBlockAndWait:^{
            
            NSError *mainContextSaveError = nil;
            if ([self.managedObjectContext save:&mainContextSaveError] == NO) {
                
                BetterLog(@"ERROR: Could not save managed object context -  %@\n%@", [mainContextSaveError localizedDescription], [mainContextSaveError userInfo]);
                if (completion) {
                    completion(mainContextSaveError);
                }
                return;
            }
            
            if ([self.writerObjectContext hasChanges]) {
                
                if (wait) {
                    [self.writerObjectContext performBlockAndWait:[self savePrivateWriterContextBlockWithCompletion:completion]];
                } else {
                    [self.writerObjectContext performBlock:[self savePrivateWriterContextBlockWithCompletion:completion]];
                }
            }
        }]; // Managed Object Context block
    } // Managed Object Context has changes
}

- (void(^)())savePrivateWriterContextBlockWithCompletion:(void (^)(NSError *))completion {
    
    void (^savePrivate)(void) = ^{
        
        NSError *privateContextError = nil;
        if ([self.writerObjectContext save:&privateContextError] == NO) {
            
            BetterLog(@"ERROR: Could not save managed object context - %@\n%@", [privateContextError localizedDescription], [privateContextError userInfo]);
            if (completion) {
                completion(privateContextError);
            }
        } else {
            if (completion) {
                completion(nil);
            }
        }
    };
    
    return savePrivate;
}



#pragma mark - Child NSManagedObjectContext

- (NSManagedObjectContext *)newPrivateChildManagedObjectContext {
    
    NSManagedObjectContext *privateChildManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [privateChildManagedObjectContext setParentContext:self.managedObjectContext];
    
    return privateChildManagedObjectContext;
}

- (NSManagedObjectContext *)newChildManagedObjectContext {
    
    NSManagedObjectContext *childManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [childManagedObjectContext setParentContext:self.managedObjectContext];
    
    return childManagedObjectContext;
}

#pragma mark - NSNotificationCenter

- (void)persistenceStackInitialized {
    
    if ([NSThread isMainThread] == NO) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self postPersistenceStackInitializedNotification];
        });
    } else {
        [self postPersistenceStackInitializedNotification];
    }
}

- (void)postPersistenceStackInitializedNotification {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:BUPersistentStoreDidInitialize object:self];
}

#pragma mark - Execute Fetch Request

- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(void (^)(NSError *error))errorBlock {
    
    NSError *error;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if(error && errorBlock) {
        errorBlock(error);
        return nil;
    }
    
    return results;
}

#pragma mark - Delete Object

- (void)deleteObject:(NSManagedObject *)object saveContextAndWait:(BOOL)saveAndWait completion:(void (^)(NSError *error))completion {
    
    [self.managedObjectContext deleteObject:object];
    [self saveContextAndWait:saveAndWait completion:completion];
}
@end
