#import "WaypointModel.h"


@interface WaypointModel ()

// Private interface goes here.

@end


@implementation WaypointModel

- (BOOL) insideRect:(CGRect)rect {
	if (self.xValue < rect.origin.x) return NO;
	if (self.yValue < rect.origin.y) return NO;
	if (self.xValue > rect.origin.x + rect.size.height) return NO;
	if (self.yValue > rect.origin.y + rect.size.width) return NO;
	
	return YES;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"(x=%f,y=%f)", self.xValue,self.yValue];
}


// getters
-(CLLocationCoordinate2D)coordinate{
	CLLocationCoordinate2D location;
	location.longitude=self.xValue;
	location.latitude=self.yValue;
	return location;
}


-(MKMapPoint)mapPoint{
	return MKMapPointForCoordinate(self.coordinate);
}



#pragma mark - legacy migration


-(void)populateWithLegacyObject:(CSPointVO*)legacyObject{
	
	self.xValue=legacyObject.point.x;
	self.yValue=legacyObject.point.y;
	self.isWalkingValue=legacyObject.isWalking;
	
}

@end
