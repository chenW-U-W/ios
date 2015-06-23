// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to POILocationModel.m instead.

#import "_POILocationModel.h"

const struct POILocationModelAttributes POILocationModelAttributes = {
	.latitude = @"latitude",
	.locationid = @"locationid",
	.longitude = @"longitude",
	.name = @"name",
	.notes = @"notes",
	.poiType = @"poiType",
	.website = @"website",
};

const struct POILocationModelRelationships POILocationModelRelationships = {
	.parentRoute = @"parentRoute",
};

const struct POILocationModelFetchedProperties POILocationModelFetchedProperties = {
};

@implementation POILocationModelID
@end

@implementation _POILocationModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"POILocationModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"POILocationModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"POILocationModel" inManagedObjectContext:moc_];
}

- (POILocationModelID*)objectID {
	return (POILocationModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic locationid;






@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic name;






@dynamic notes;






@dynamic poiType;






@dynamic website;






@dynamic parentRoute;

	






@end
