#import "_RouteModel.h"
#import "SegmentModel.h"

@interface RouteModel : _RouteModel {}


// getters

// formatted ui strings
-(NSString*)			timeString;
-(NSString*)			lengthString;
-(NSString*)			speedString;
-(NSString*)			dateString;
-(NSString*)			dateOnlyString;
-(NSString*)			planString;
-(NSString*)			nameString;
-(NSString*)			calorieString;
-(NSString*)			coString;

// counts
-(NSInteger)			numSegments;
-(NSInteger)			coordCount;

// coords
-(CLLocationCoordinate2D)    basicNorthEast;
-(CLLocationCoordinate2D)    basicSouthWest;
-(CLLocationCoordinate2D)    insetNorthEast;
-(CLLocationCoordinate2D)    insetSouthWest;


-(NSString*)			fileid;

// state
-(BOOL)					containsWalkingSections;

-(BOOL)					hasWaypoints;

// elevations
-(int)					maxElevation;
-(int)					elevationsCount;
-(BOOL)					hasElevationData;


// pois
-(BOOL)					hasPOIs;


-(NSURL*)				csrouteurl;
-(NSString*)			csBrowserRouteurlString;
-(NSString*)			csiOSRouteurlString;


-(NSDate*)				dateObject;


// methods


- (SegmentModel *) segmentAtIndex:(NSInteger)index;

-(NSMutableArray*)createCorrectedWaypointArray;

// returns max bounding locations for self compared to location
-(CLLocationCoordinate2D)maxSouthWestForLocation:(CLLocation*)comparelocation;
-(CLLocationCoordinate2D)maxNorthEastForLocation:(CLLocation*)comparelocation;

-(NSString*)lengthPercentStringForPercent:(float)percent;


@end
