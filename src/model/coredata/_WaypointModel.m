// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WaypointModel.m instead.

#import "_WaypointModel.h"

const struct WaypointModelAttributes WaypointModelAttributes = {
	.isWalking = @"isWalking",
	.x = @"x",
	.y = @"y",
};

const struct WaypointModelRelationships WaypointModelRelationships = {
	.parentRoute = @"parentRoute",
	.parentSegment = @"parentSegment",
};

const struct WaypointModelFetchedProperties WaypointModelFetchedProperties = {
};

@implementation WaypointModelID
@end

@implementation _WaypointModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WaypointModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WaypointModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WaypointModel" inManagedObjectContext:moc_];
}

- (WaypointModelID*)objectID {
	return (WaypointModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isWalkingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isWalking"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"xValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"x"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"yValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"y"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic isWalking;



- (BOOL)isWalkingValue {
	NSNumber *result = [self isWalking];
	return [result boolValue];
}

- (void)setIsWalkingValue:(BOOL)value_ {
	[self setIsWalking:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsWalkingValue {
	NSNumber *result = [self primitiveIsWalking];
	return [result boolValue];
}

- (void)setPrimitiveIsWalkingValue:(BOOL)value_ {
	[self setPrimitiveIsWalking:[NSNumber numberWithBool:value_]];
}





@dynamic x;



- (float)xValue {
	NSNumber *result = [self x];
	return [result floatValue];
}

- (void)setXValue:(float)value_ {
	[self setX:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveXValue {
	NSNumber *result = [self primitiveX];
	return [result floatValue];
}

- (void)setPrimitiveXValue:(float)value_ {
	[self setPrimitiveX:[NSNumber numberWithFloat:value_]];
}





@dynamic y;



- (float)yValue {
	NSNumber *result = [self y];
	return [result floatValue];
}

- (void)setYValue:(float)value_ {
	[self setY:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveYValue {
	NSNumber *result = [self primitiveY];
	return [result floatValue];
}

- (void)setPrimitiveYValue:(float)value_ {
	[self setPrimitiveY:[NSNumber numberWithFloat:value_]];
}





@dynamic parentRoute;

	

@dynamic parentSegment;

	






@end
