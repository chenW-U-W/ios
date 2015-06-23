// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to POILocationModel.h instead.

#import <CoreData/CoreData.h>


extern const struct POILocationModelAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *locationid;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *poiType;
	__unsafe_unretained NSString *website;
} POILocationModelAttributes;

extern const struct POILocationModelRelationships {
	__unsafe_unretained NSString *parentRoute;
} POILocationModelRelationships;

extern const struct POILocationModelFetchedProperties {
} POILocationModelFetchedProperties;

@class RouteModel;









@interface POILocationModelID : NSManagedObjectID {}
@end

@interface _POILocationModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (POILocationModelID*)objectID;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* locationid;



//- (BOOL)validateLocationid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* notes;



//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* poiType;



//- (BOOL)validatePoiType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* website;



//- (BOOL)validateWebsite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) RouteModel *parentRoute;

//- (BOOL)validateParentRoute:(id*)value_ error:(NSError**)error_;





@end

@interface _POILocationModel (CoreDataGeneratedAccessors)

@end

@interface _POILocationModel (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSString*)primitiveLocationid;
- (void)setPrimitiveLocationid:(NSString*)value;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNotes;
- (void)setPrimitiveNotes:(NSString*)value;




- (NSString*)primitivePoiType;
- (void)setPrimitivePoiType:(NSString*)value;




- (NSString*)primitiveWebsite;
- (void)setPrimitiveWebsite:(NSString*)value;





- (RouteModel*)primitiveParentRoute;
- (void)setPrimitiveParentRoute:(RouteModel*)value;


@end
