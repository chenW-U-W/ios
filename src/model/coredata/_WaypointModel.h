// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WaypointModel.h instead.

#import <CoreData/CoreData.h>


extern const struct WaypointModelAttributes {
	__unsafe_unretained NSString *isWalking;
	__unsafe_unretained NSString *x;
	__unsafe_unretained NSString *y;
} WaypointModelAttributes;

extern const struct WaypointModelRelationships {
	__unsafe_unretained NSString *parentRoute;
	__unsafe_unretained NSString *parentSegment;
} WaypointModelRelationships;

extern const struct WaypointModelFetchedProperties {
} WaypointModelFetchedProperties;

@class RouteModel;
@class SegmentModel;





@interface WaypointModelID : NSManagedObjectID {}
@end

@interface _WaypointModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WaypointModelID*)objectID;





@property (nonatomic, strong) NSNumber* isWalking;



@property BOOL isWalkingValue;
- (BOOL)isWalkingValue;
- (void)setIsWalkingValue:(BOOL)value_;

//- (BOOL)validateIsWalking:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* x;



@property float xValue;
- (float)xValue;
- (void)setXValue:(float)value_;

//- (BOOL)validateX:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* y;



@property float yValue;
- (float)yValue;
- (void)setYValue:(float)value_;

//- (BOOL)validateY:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) RouteModel *parentRoute;

//- (BOOL)validateParentRoute:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) SegmentModel *parentSegment;

//- (BOOL)validateParentSegment:(id*)value_ error:(NSError**)error_;





@end

@interface _WaypointModel (CoreDataGeneratedAccessors)

@end

@interface _WaypointModel (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveIsWalking;
- (void)setPrimitiveIsWalking:(NSNumber*)value;

- (BOOL)primitiveIsWalkingValue;
- (void)setPrimitiveIsWalkingValue:(BOOL)value_;




- (NSNumber*)primitiveX;
- (void)setPrimitiveX:(NSNumber*)value;

- (float)primitiveXValue;
- (void)setPrimitiveXValue:(float)value_;




- (NSNumber*)primitiveY;
- (void)setPrimitiveY:(NSNumber*)value;

- (float)primitiveYValue;
- (void)setPrimitiveYValue:(float)value_;





- (RouteModel*)primitiveParentRoute;
- (void)setPrimitiveParentRoute:(RouteModel*)value;



- (SegmentModel*)primitiveParentSegment;
- (void)setPrimitiveParentSegment:(SegmentModel*)value;


@end
