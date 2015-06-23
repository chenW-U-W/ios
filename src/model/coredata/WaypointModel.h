#import "_WaypointModel.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WaypointModel : _WaypointModel {}



- (BOOL) insideRect:(CGRect)rect;

// getters
-(CLLocationCoordinate2D)coordinate;
-(MKMapPoint)mapPoint;

@end
