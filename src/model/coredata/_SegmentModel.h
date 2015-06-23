// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SegmentModel.h instead.

#import <CoreData/CoreData.h>


extern const struct SegmentModelAttributes {
	__unsafe_unretained NSString *elevations;
	__unsafe_unretained NSString *provisionName;
	__unsafe_unretained NSString *roadName;
	__unsafe_unretained NSString *segmentBusynance;
	__unsafe_unretained NSString *segmentDistance;
	__unsafe_unretained NSString *segmentTime;
	__unsafe_unretained NSString *startBearing;
	__unsafe_unretained NSString *startDistance;
	__unsafe_unretained NSString *startTime;
	__unsafe_unretained NSString *turnType;
	__unsafe_unretained NSString *walkValue;
} SegmentModelAttributes;

extern const struct SegmentModelRelationships {
	__unsafe_unretained NSString *parentRoute;
	__unsafe_unretained NSString *pointArray;
} SegmentModelRelationships;

extern const struct SegmentModelFetchedProperties {
} SegmentModelFetchedProperties;

@class RouteModel;
@class WaypointModel;













@interface SegmentModelID : NSManagedObjectID {}
@end

@interface _SegmentModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SegmentModelID*)objectID;





@property (nonatomic, strong) NSString* elevations;



//- (BOOL)validateElevations:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* provisionName;



//- (BOOL)validateProvisionName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* roadName;



//- (BOOL)validateRoadName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* segmentBusynance;



@property int32_t segmentBusynanceValue;
- (int32_t)segmentBusynanceValue;
- (void)setSegmentBusynanceValue:(int32_t)value_;

//- (BOOL)validateSegmentBusynance:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* segmentDistance;



@property int32_t segmentDistanceValue;
- (int32_t)segmentDistanceValue;
- (void)setSegmentDistanceValue:(int32_t)value_;

//- (BOOL)validateSegmentDistance:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* segmentTime;



@property int32_t segmentTimeValue;
- (int32_t)segmentTimeValue;
- (void)setSegmentTimeValue:(int32_t)value_;

//- (BOOL)validateSegmentTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startBearing;



@property int32_t startBearingValue;
- (int32_t)startBearingValue;
- (void)setStartBearingValue:(int32_t)value_;

//- (BOOL)validateStartBearing:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startDistance;



@property int32_t startDistanceValue;
- (int32_t)startDistanceValue;
- (void)setStartDistanceValue:(int32_t)value_;

//- (BOOL)validateStartDistance:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startTime;



@property int32_t startTimeValue;
- (int32_t)startTimeValue;
- (void)setStartTimeValue:(int32_t)value_;

//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* turnType;



//- (BOOL)validateTurnType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* walkValue;



@property int32_t walkValueValue;
- (int32_t)walkValueValue;
- (void)setWalkValueValue:(int32_t)value_;

//- (BOOL)validateWalkValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) RouteModel *parentRoute;

//- (BOOL)validateParentRoute:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSOrderedSet *pointArray;

- (NSMutableOrderedSet*)pointArraySet;





@end

@interface _SegmentModel (CoreDataGeneratedAccessors)

- (void)addPointArray:(NSOrderedSet*)value_;
- (void)removePointArray:(NSOrderedSet*)value_;
- (void)addPointArrayObject:(WaypointModel*)value_;
- (void)removePointArrayObject:(WaypointModel*)value_;

@end

@interface _SegmentModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveElevations;
- (void)setPrimitiveElevations:(NSString*)value;




- (NSString*)primitiveProvisionName;
- (void)setPrimitiveProvisionName:(NSString*)value;




- (NSString*)primitiveRoadName;
- (void)setPrimitiveRoadName:(NSString*)value;




- (NSNumber*)primitiveSegmentBusynance;
- (void)setPrimitiveSegmentBusynance:(NSNumber*)value;

- (int32_t)primitiveSegmentBusynanceValue;
- (void)setPrimitiveSegmentBusynanceValue:(int32_t)value_;




- (NSNumber*)primitiveSegmentDistance;
- (void)setPrimitiveSegmentDistance:(NSNumber*)value;

- (int32_t)primitiveSegmentDistanceValue;
- (void)setPrimitiveSegmentDistanceValue:(int32_t)value_;




- (NSNumber*)primitiveSegmentTime;
- (void)setPrimitiveSegmentTime:(NSNumber*)value;

- (int32_t)primitiveSegmentTimeValue;
- (void)setPrimitiveSegmentTimeValue:(int32_t)value_;




- (NSNumber*)primitiveStartBearing;
- (void)setPrimitiveStartBearing:(NSNumber*)value;

- (int32_t)primitiveStartBearingValue;
- (void)setPrimitiveStartBearingValue:(int32_t)value_;




- (NSNumber*)primitiveStartDistance;
- (void)setPrimitiveStartDistance:(NSNumber*)value;

- (int32_t)primitiveStartDistanceValue;
- (void)setPrimitiveStartDistanceValue:(int32_t)value_;




- (NSNumber*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSNumber*)value;

- (int32_t)primitiveStartTimeValue;
- (void)setPrimitiveStartTimeValue:(int32_t)value_;




- (NSString*)primitiveTurnType;
- (void)setPrimitiveTurnType:(NSString*)value;




- (NSNumber*)primitiveWalkValue;
- (void)setPrimitiveWalkValue:(NSNumber*)value;

- (int32_t)primitiveWalkValueValue;
- (void)setPrimitiveWalkValueValue:(int32_t)value_;





- (RouteModel*)primitiveParentRoute;
- (void)setPrimitiveParentRoute:(RouteModel*)value;



- (NSMutableOrderedSet*)primitivePointArray;
- (void)setPrimitivePointArray:(NSMutableOrderedSet*)value;


@end
