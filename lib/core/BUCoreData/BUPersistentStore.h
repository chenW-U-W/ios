//
//  BUPersistentStore.h
//  Flotsm
//
//  Created by Neil Edwards on 04/11/2014.
//  Copyright (c) 2014 mohawk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


/**
 Posted whenever the Core Data stack is completely setup.
 */
extern NSString *const BUPersistentStoreDidInitialize;


@interface BUPersistentStore : NSObject

+ (BUPersistentStore *)mainStore;

/**
 The persistence controller's main managed object context. (read-only)
 */
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;


- (BOOL)setupWithStoreName:(NSString *)storeName modelName:(NSString *)modelName;

/**
 Returns a new private child managed object context with a concurrency type of `NSPrivateQueueConcurrencyType`.
 
 @return A new managed object context object.
 */
- (NSManagedObjectContext *)newPrivateChildManagedObjectContext;

/**
 Returns a new child managed object context with a concurrency type of `NSMainQueueConcurrencyType`.
 
 @return A new managed object context object.
 */
- (NSManagedObjectContext *)newChildManagedObjectContext;

/**
 Attempts to commit unsaved changes to registered objects to disk.
 
 @param wait If set the primary context is saved synchronously otherwise asynchronously.
 @param completion An optional block to be executed when saving has completed.
 */
- (void)saveContextAndWait:(BOOL)wait completion:(void (^)(NSError *error))completion;

-(void)fastSave;

/**
 Executes the given fetch request with the main managedObjectContext
 and returns an array of results if successful, otherwise returns nil and calls the
 error block.
 
 @param request An NSFetchRequest that will execute on the managedObjectContext.
 @param error A block that will be called if an error occurs during the fetch.
 
 @return An NSArray of the results, or nil if an error occured. If there were no results
 and no error, an empty array is returned.
 */
- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(void (^)(NSError *error))errorBlock;

/**
 Deletes the given NSMangedObject using the main managedObjectContext and saves the changes by
 Passing the given BOOL and completion block as parameters to `-saveContextAndWait:completion:`.
 
 @param object The NSMangedObject to delete.
 @param saveAndWait The BOOL that will be passed to `-saveContextAndWait:completion:`
 @param completion An optional block that will be passed to `-saveContextAndWait:completion:`.
 */
- (void)deleteObject:(NSManagedObject *)object saveContextAndWait:(BOOL)saveAndWait completion:(void (^)(NSError *error))completion;



@end
