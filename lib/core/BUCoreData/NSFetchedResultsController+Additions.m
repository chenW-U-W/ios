//
//  NSFetchedResultsController+Additions.m
//  Flotsm
//
//  Created by Neil Edwards on 05/11/2014.
//  Copyright (c) 2014 mohawk. All rights reserved.
//

#import "NSFetchedResultsController+Additions.h"

@implementation NSFetchedResultsController (Additions)


-(id)firstObject{
   
    return [self.fetchedObjects firstObject];
    
}


-(id)lastObject{
    
    return [self.fetchedObjects lastObject];
    
}


-(NSUInteger) numberOfObjectsForSection: (NSUInteger) section {
    id <NSFetchedResultsSectionInfo> sectionInfo;
    sectionInfo = [self.sections objectAtIndex: section];
    return sectionInfo.numberOfObjects;
}


-(id) objectForRow: (NSUInteger) row inSection: (NSUInteger) section {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    return [self objectAtIndexPath: indexPath];
}





@end
