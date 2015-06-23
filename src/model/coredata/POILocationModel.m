#import "POILocationModel.h"


@interface POILocationModel ()

// Private interface goes here.

@end


@implementation POILocationModel

// getters
-(CLLocationCoordinate2D)coordinate{
	CLLocationCoordinate2D location;
	location.longitude=self.longitudeValue;
	location.latitude=self.latitudeValue;
	return location;
}


#pragma mark - legacy migration

-(void)populateWithLegacyObject:(POILocationVO*)legacyObject{
	
	self.poiType=legacyObject.poiType;
	self.locationid=legacyObject.locationid;
	self.name=legacyObject.name;
	self.notes=legacyObject.notes;
	self.website=legacyObject.website;
	
	self.latitudeValue=legacyObject.coordinate.latitude;
	self.longitudeValue=legacyObject.coordinate.longitude;
	
}

@end
