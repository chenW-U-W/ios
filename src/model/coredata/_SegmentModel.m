// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SegmentModel.m instead.

#import "_SegmentModel.h"

const struct SegmentModelAttributes SegmentModelAttributes = {
	.elevations = @"elevations",
	.provisionName = @"provisionName",
	.roadName = @"roadName",
	.segmentBusynance = @"segmentBusynance",
	.segmentDistance = @"segmentDistance",
	.segmentTime = @"segmentTime",
	.startBearing = @"startBearing",
	.startDistance = @"startDistance",
	.startTime = @"startTime",
	.turnType = @"turnType",
	.walkValue = @"walkValue",
};

const struct SegmentModelRelationships SegmentModelRelationships = {
	.parentRoute = @"parentRoute",
	.pointArray = @"pointArray",
};

const struct SegmentModelFetchedProperties SegmentModelFetchedProperties = {
};

@implementation SegmentModelID
@end

@implementation _SegmentModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SegmentModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SegmentModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SegmentModel" inManagedObjectContext:moc_];
}

- (SegmentModelID*)objectID {
	return (SegmentModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"segmentBusynanceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"segmentBusynance"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"segmentDistanceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"segmentDistance"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"segmentTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"segmentTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"startBearingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"startBearing"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"startDistanceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"startDistance"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"startTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"startTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"walkValueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"walkValue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic elevations;






@dynamic provisionName;






@dynamic roadName;






@dynamic segmentBusynance;



- (int32_t)segmentBusynanceValue {
	NSNumber *result = [self segmentBusynance];
	return [result intValue];
}

- (void)setSegmentBusynanceValue:(int32_t)value_ {
	[self setSegmentBusynance:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSegmentBusynanceValue {
	NSNumber *result = [self primitiveSegmentBusynance];
	return [result intValue];
}

- (void)setPrimitiveSegmentBusynanceValue:(int32_t)value_ {
	[self setPrimitiveSegmentBusynance:[NSNumber numberWithInt:value_]];
}





@dynamic segmentDistance;



- (int32_t)segmentDistanceValue {
	NSNumber *result = [self segmentDistance];
	return [result intValue];
}

- (void)setSegmentDistanceValue:(int32_t)value_ {
	[self setSegmentDistance:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSegmentDistanceValue {
	NSNumber *result = [self primitiveSegmentDistance];
	return [result intValue];
}

- (void)setPrimitiveSegmentDistanceValue:(int32_t)value_ {
	[self setPrimitiveSegmentDistance:[NSNumber numberWithInt:value_]];
}





@dynamic segmentTime;



- (int32_t)segmentTimeValue {
	NSNumber *result = [self segmentTime];
	return [result intValue];
}

- (void)setSegmentTimeValue:(int32_t)value_ {
	[self setSegmentTime:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSegmentTimeValue {
	NSNumber *result = [self primitiveSegmentTime];
	return [result intValue];
}

- (void)setPrimitiveSegmentTimeValue:(int32_t)value_ {
	[self setPrimitiveSegmentTime:[NSNumber numberWithInt:value_]];
}





@dynamic startBearing;



- (int32_t)startBearingValue {
	NSNumber *result = [self startBearing];
	return [result intValue];
}

- (void)setStartBearingValue:(int32_t)value_ {
	[self setStartBearing:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStartBearingValue {
	NSNumber *result = [self primitiveStartBearing];
	return [result intValue];
}

- (void)setPrimitiveStartBearingValue:(int32_t)value_ {
	[self setPrimitiveStartBearing:[NSNumber numberWithInt:value_]];
}





@dynamic startDistance;



- (int32_t)startDistanceValue {
	NSNumber *result = [self startDistance];
	return [result intValue];
}

- (void)setStartDistanceValue:(int32_t)value_ {
	[self setStartDistance:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStartDistanceValue {
	NSNumber *result = [self primitiveStartDistance];
	return [result intValue];
}

- (void)setPrimitiveStartDistanceValue:(int32_t)value_ {
	[self setPrimitiveStartDistance:[NSNumber numberWithInt:value_]];
}





@dynamic startTime;



- (int32_t)startTimeValue {
	NSNumber *result = [self startTime];
	return [result intValue];
}

- (void)setStartTimeValue:(int32_t)value_ {
	[self setStartTime:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStartTimeValue {
	NSNumber *result = [self primitiveStartTime];
	return [result intValue];
}

- (void)setPrimitiveStartTimeValue:(int32_t)value_ {
	[self setPrimitiveStartTime:[NSNumber numberWithInt:value_]];
}





@dynamic turnType;






@dynamic walkValue;



- (int32_t)walkValueValue {
	NSNumber *result = [self walkValue];
	return [result intValue];
}

- (void)setWalkValueValue:(int32_t)value_ {
	[self setWalkValue:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWalkValueValue {
	NSNumber *result = [self primitiveWalkValue];
	return [result intValue];
}

- (void)setPrimitiveWalkValueValue:(int32_t)value_ {
	[self setPrimitiveWalkValue:[NSNumber numberWithInt:value_]];
}





@dynamic parentRoute;

	

@dynamic pointArray;

	
- (NSMutableOrderedSet*)pointArraySet {
	[self willAccessValueForKey:@"pointArray"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"pointArray"];
  
	[self didAccessValueForKey:@"pointArray"];
	return result;
}
	






@end
