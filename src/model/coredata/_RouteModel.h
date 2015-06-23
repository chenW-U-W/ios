// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RouteModel.h instead.

#import <CoreData/CoreData.h>


extern const struct RouteModelAttributes {
	__unsafe_unretained NSString *calorie;
	__unsafe_unretained NSString *cosaved;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *length;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *nelatitude;
	__unsafe_unretained NSString *nelongitude;
	__unsafe_unretained NSString *plan;
	__unsafe_unretained NSString *routeID;
	__unsafe_unretained NSString *speed;
	__unsafe_unretained NSString *storeType;
	__unsafe_unretained NSString *swlatitude;
	__unsafe_unretained NSString *swlongitude;
	__unsafe_unretained NSString *time;
	__unsafe_unretained NSString *userRouteName;
} RouteModelAttributes;

extern const struct RouteModelRelationships {
	__unsafe_unretained NSString *pois;
	__unsafe_unretained NSString *segments;
	__unsafe_unretained NSString *waypoints;
} RouteModelRelationships;

extern const struct RouteModelFetchedProperties {
} RouteModelFetchedProperties;

@class POILocationModel;
@class SegmentModel;
@class WaypointModel;

















@interface RouteModelID : NSManagedObjectID {}
@end

@interface _RouteModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RouteModelID*)objectID;





@property (nonatomic, strong) NSString* calorie;



//- (BOOL)validateCalorie:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* cosaved;



//- (BOOL)validateCosaved:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* length;



@property int32_t lengthValue;
- (int32_t)lengthValue;
- (void)setLengthValue:(int32_t)value_;

//- (BOOL)validateLength:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* nelatitude;



@property double nelatitudeValue;
- (double)nelatitudeValue;
- (void)setNelatitudeValue:(double)value_;

//- (BOOL)validateNelatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* nelongitude;



@property double nelongitudeValue;
- (double)nelongitudeValue;
- (void)setNelongitudeValue:(double)value_;

//- (BOOL)validateNelongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* plan;



//- (BOOL)validatePlan:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* routeID;



//- (BOOL)validateRouteID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* speed;



@property int32_t speedValue;
- (int32_t)speedValue;
- (void)setSpeedValue:(int32_t)value_;

//- (BOOL)validateSpeed:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* storeType;



@property int32_t storeTypeValue;
- (int32_t)storeTypeValue;
- (void)setStoreTypeValue:(int32_t)value_;

//- (BOOL)validateStoreType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* swlatitude;



@property double swlatitudeValue;
- (double)swlatitudeValue;
- (void)setSwlatitudeValue:(double)value_;

//- (BOOL)validateSwlatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* swlongitude;



@property double swlongitudeValue;
- (double)swlongitudeValue;
- (void)setSwlongitudeValue:(double)value_;

//- (BOOL)validateSwlongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* time;



@property int32_t timeValue;
- (int32_t)timeValue;
- (void)setTimeValue:(int32_t)value_;

//- (BOOL)validateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userRouteName;



//- (BOOL)validateUserRouteName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSOrderedSet *pois;

- (NSMutableOrderedSet*)poisSet;




@property (nonatomic, strong) NSOrderedSet *segments;

- (NSMutableOrderedSet*)segmentsSet;




@property (nonatomic, strong) NSOrderedSet *waypoints;

- (NSMutableOrderedSet*)waypointsSet;





@end

@interface _RouteModel (CoreDataGeneratedAccessors)

- (void)addPois:(NSOrderedSet*)value_;
- (void)removePois:(NSOrderedSet*)value_;
- (void)addPoisObject:(POILocationModel*)value_;
- (void)removePoisObject:(POILocationModel*)value_;

- (void)addSegments:(NSOrderedSet*)value_;
- (void)removeSegments:(NSOrderedSet*)value_;
- (void)addSegmentsObject:(SegmentModel*)value_;
- (void)removeSegmentsObject:(SegmentModel*)value_;

- (void)addWaypoints:(NSOrderedSet*)value_;
- (void)removeWaypoints:(NSOrderedSet*)value_;
- (void)addWaypointsObject:(WaypointModel*)value_;
- (void)removeWaypointsObject:(WaypointModel*)value_;

@end

@interface _RouteModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCalorie;
- (void)setPrimitiveCalorie:(NSString*)value;




- (NSString*)primitiveCosaved;
- (void)setPrimitiveCosaved:(NSString*)value;




- (NSString*)primitiveDate;
- (void)setPrimitiveDate:(NSString*)value;




- (NSNumber*)primitiveLength;
- (void)setPrimitiveLength:(NSNumber*)value;

- (int32_t)primitiveLengthValue;
- (void)setPrimitiveLengthValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveNelatitude;
- (void)setPrimitiveNelatitude:(NSNumber*)value;

- (double)primitiveNelatitudeValue;
- (void)setPrimitiveNelatitudeValue:(double)value_;




- (NSNumber*)primitiveNelongitude;
- (void)setPrimitiveNelongitude:(NSNumber*)value;

- (double)primitiveNelongitudeValue;
- (void)setPrimitiveNelongitudeValue:(double)value_;




- (NSString*)primitivePlan;
- (void)setPrimitivePlan:(NSString*)value;




- (NSString*)primitiveRouteID;
- (void)setPrimitiveRouteID:(NSString*)value;




- (NSNumber*)primitiveSpeed;
- (void)setPrimitiveSpeed:(NSNumber*)value;

- (int32_t)primitiveSpeedValue;
- (void)setPrimitiveSpeedValue:(int32_t)value_;




- (NSNumber*)primitiveStoreType;
- (void)setPrimitiveStoreType:(NSNumber*)value;

- (int32_t)primitiveStoreTypeValue;
- (void)setPrimitiveStoreTypeValue:(int32_t)value_;




- (NSNumber*)primitiveSwlatitude;
- (void)setPrimitiveSwlatitude:(NSNumber*)value;

- (double)primitiveSwlatitudeValue;
- (void)setPrimitiveSwlatitudeValue:(double)value_;




- (NSNumber*)primitiveSwlongitude;
- (void)setPrimitiveSwlongitude:(NSNumber*)value;

- (double)primitiveSwlongitudeValue;
- (void)setPrimitiveSwlongitudeValue:(double)value_;




- (NSNumber*)primitiveTime;
- (void)setPrimitiveTime:(NSNumber*)value;

- (int32_t)primitiveTimeValue;
- (void)setPrimitiveTimeValue:(int32_t)value_;




- (NSString*)primitiveUserRouteName;
- (void)setPrimitiveUserRouteName:(NSString*)value;





- (NSMutableOrderedSet*)primitivePois;
- (void)setPrimitivePois:(NSMutableOrderedSet*)value;



- (NSMutableOrderedSet*)primitiveSegments;
- (void)setPrimitiveSegments:(NSMutableOrderedSet*)value;



- (NSMutableOrderedSet*)primitiveWaypoints;
- (void)setPrimitiveWaypoints:(NSMutableOrderedSet*)value;


@end
