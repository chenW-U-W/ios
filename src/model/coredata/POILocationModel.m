#import "POILocationModel.h"


@interface POILocationModel ()

// Private interface goes here.

@end


@implementation POILocationModel

// getters
-(CLLocationCoordinate2D)coordinate{
	CLLocationCoordinate2D location;
	location.longitude=self.longitudeValue
	location.latitude=self.latitudeValue;
	return location;
}

@end
