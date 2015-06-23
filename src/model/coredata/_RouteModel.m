// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RouteModel.m instead.

#import "_RouteModel.h"

const struct RouteModelAttributes RouteModelAttributes = {
	.calorie = @"calorie",
	.cosaved = @"cosaved",
	.date = @"date",
	.length = @"length",
	.name = @"name",
	.nelatitude = @"nelatitude",
	.nelongitude = @"nelongitude",
	.plan = @"plan",
	.routeID = @"routeID",
	.speed = @"speed",
	.storeType = @"storeType",
	.swlatitude = @"swlatitude",
	.swlongitude = @"swlongitude",
	.time = @"time",
	.userRouteName = @"userRouteName",
};

const struct RouteModelRelationships RouteModelRelationships = {
	.pois = @"pois",
	.segments = @"segments",
	.waypoints = @"waypoints",
};

const struct RouteModelFetchedProperties RouteModelFetchedProperties = {
};

@implementation RouteModelID
@end

@implementation _RouteModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RouteModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RouteModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RouteModel" inManagedObjectContext:moc_];
}

- (RouteModelID*)objectID {
	return (RouteModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"lengthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"length"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"nelatitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"nelatitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"nelongitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"nelongitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"speedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"speed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"storeTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"storeType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"swlatitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"swlatitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"swlongitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"swlongitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"time"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic calorie;






@dynamic cosaved;






@dynamic date;






@dynamic length;



- (int32_t)lengthValue {
	NSNumber *result = [self length];
	return [result intValue];
}

- (void)setLengthValue:(int32_t)value_ {
	[self setLength:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveLengthValue {
	NSNumber *result = [self primitiveLength];
	return [result intValue];
}

- (void)setPrimitiveLengthValue:(int32_t)value_ {
	[self setPrimitiveLength:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic nelatitude;



- (double)nelatitudeValue {
	NSNumber *result = [self nelatitude];
	return [result doubleValue];
}

- (void)setNelatitudeValue:(double)value_ {
	[self setNelatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveNelatitudeValue {
	NSNumber *result = [self primitiveNelatitude];
	return [result doubleValue];
}

- (void)setPrimitiveNelatitudeValue:(double)value_ {
	[self setPrimitiveNelatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic nelongitude;



- (double)nelongitudeValue {
	NSNumber *result = [self nelongitude];
	return [result doubleValue];
}

- (void)setNelongitudeValue:(double)value_ {
	[self setNelongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveNelongitudeValue {
	NSNumber *result = [self primitiveNelongitude];
	return [result doubleValue];
}

- (void)setPrimitiveNelongitudeValue:(double)value_ {
	[self setPrimitiveNelongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic plan;






@dynamic routeID;






@dynamic speed;



- (int32_t)speedValue {
	NSNumber *result = [self speed];
	return [result intValue];
}

- (void)setSpeedValue:(int32_t)value_ {
	[self setSpeed:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSpeedValue {
	NSNumber *result = [self primitiveSpeed];
	return [result intValue];
}

- (void)setPrimitiveSpeedValue:(int32_t)value_ {
	[self setPrimitiveSpeed:[NSNumber numberWithInt:value_]];
}





@dynamic storeType;



- (int32_t)storeTypeValue {
	NSNumber *result = [self storeType];
	return [result intValue];
}

- (void)setStoreTypeValue:(int32_t)value_ {
	[self setStoreType:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStoreTypeValue {
	NSNumber *result = [self primitiveStoreType];
	return [result intValue];
}

- (void)setPrimitiveStoreTypeValue:(int32_t)value_ {
	[self setPrimitiveStoreType:[NSNumber numberWithInt:value_]];
}





@dynamic swlatitude;



- (double)swlatitudeValue {
	NSNumber *result = [self swlatitude];
	return [result doubleValue];
}

- (void)setSwlatitudeValue:(double)value_ {
	[self setSwlatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveSwlatitudeValue {
	NSNumber *result = [self primitiveSwlatitude];
	return [result doubleValue];
}

- (void)setPrimitiveSwlatitudeValue:(double)value_ {
	[self setPrimitiveSwlatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic swlongitude;



- (double)swlongitudeValue {
	NSNumber *result = [self swlongitude];
	return [result doubleValue];
}

- (void)setSwlongitudeValue:(double)value_ {
	[self setSwlongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveSwlongitudeValue {
	NSNumber *result = [self primitiveSwlongitude];
	return [result doubleValue];
}

- (void)setPrimitiveSwlongitudeValue:(double)value_ {
	[self setPrimitiveSwlongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic time;



- (int32_t)timeValue {
	NSNumber *result = [self time];
	return [result intValue];
}

- (void)setTimeValue:(int32_t)value_ {
	[self setTime:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTimeValue {
	NSNumber *result = [self primitiveTime];
	return [result intValue];
}

- (void)setPrimitiveTimeValue:(int32_t)value_ {
	[self setPrimitiveTime:[NSNumber numberWithInt:value_]];
}





@dynamic userRouteName;






@dynamic pois;

	
- (NSMutableOrderedSet*)poisSet {
	[self willAccessValueForKey:@"pois"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"pois"];
  
	[self didAccessValueForKey:@"pois"];
	return result;
}
	

@dynamic segments;

	
- (NSMutableOrderedSet*)segmentsSet {
	[self willAccessValueForKey:@"segments"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"segments"];
  
	[self didAccessValueForKey:@"segments"];
	return result;
}
	

@dynamic waypoints;

	
- (NSMutableOrderedSet*)waypointsSet {
	[self willAccessValueForKey:@"waypoints"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"waypoints"];
  
	[self didAccessValueForKey:@"waypoints"];
	return result;
}
	






@end
