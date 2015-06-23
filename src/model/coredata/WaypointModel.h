#import "_WaypointModel.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "CSPointVO.h"

@interface WaypointModel : _WaypointModel {}



- (BOOL) insideRect:(CGRect)rect;

// getters
-(CLLocationCoordinate2D)coordinate;
-(MKMapPoint)mapPoint;


-(void)populateWithLegacyObject:(CSPointVO*)legacyObject;

@end
