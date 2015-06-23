//
//  NSManagedObject+BUCoreData.h
//  Flotsm
//
//  Created by Neil Edwards on 04/11/2014.
//  Copyright (c) 2014 mohawk. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "BUPersistentStore.h"

@interface NSManagedObject (BUCoreData)

// CREATION

+ (id)create;
+ (id)createInStore:(BUPersistentStore *)store;

// QUERY

+ (NSArray *)all;
+ (NSArray *)allForPredicate:(NSPredicate *)predicate;
+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending;
+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending;
+ (NSArray *)allInStore:(BUPersistentStore *)store;
+ (NSArray *)allForPredicate:(NSPredicate *)predicate inStore:(BUPersistentStore *)store;
+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending inStore:(BUPersistentStore *)store;
+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending inStore:(BUPersistentStore *)store;

+ (id)first;
+ (id)firstWithKey:(NSString *)key value:(NSObject *)value;

+ (id)firstInStore:(BUPersistentStore *)store;
+ (id)firstWithKey:(NSString *)key value:(NSObject *)value inStore:(BUPersistentStore *)store;

+ (id)oneForPredicate:(NSPredicate*)predicate orderBy:(NSString *)key ascending:(BOOL)ascending inStore:(BUPersistentStore *)store;

// DELETE/DESTROY

+ (void)destroyAll;
+ (void)destroyAllInStore:(BUPersistentStore *)store;

- (void)destroy;



@end
