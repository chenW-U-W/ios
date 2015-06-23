#import "RouteModel.h"
#import "SegmentModel.h"
#import "SettingsManager.h"
#import "NSDate+Helper.h"

@interface RouteModel ()

// Private interface goes here.

@end


@implementation RouteModel


- (SegmentModel *) segmentAtIndex:(NSInteger)index {
	return [self.segments objectAtIndex:index];
}


#pragma mark - getters
//
/***********************************************
 * @description			getters
 ***********************************************/
//

- (NSInteger) numSegments {
	return [self.segments count];
}


-(NSInteger)coordCount{
	
	NSInteger count=0;
	
	for (int i = 0; i < [self numSegments]; i++) {
		
		if (i == 0)
			count++;
		
		SegmentModel *segment = [self segmentAtIndex:i];
		NSArray *allPoints = [segment allPoints];
		for (int i = 1; i < [allPoints count]; i++) {
			count++;
		}
	}
	
	return count;
	
}



- (NSString *) nameString {
	
	if(self.userRouteName==nil || [self.userRouteName isEqualToString:EMPTYSTRING]){
		return self.name;
	}else{
		return self.userRouteName;
	}
}


-(NSString*)timeString{
	
	NSInteger h = [self timeValue] / 3600;
	NSInteger m = ([self timeValue] / 60) % 60;
	NSInteger s = [self timeValue] % 60;
	
	if ([self timeValue]>3600) {
		return [NSString stringWithFormat:@"%02lu:%02lu:%02lu", (unsigned long)h,(unsigned long)m,(unsigned long)s];
	}else {
		return [NSString stringWithFormat:@"%02lu:%02lu", (unsigned long)m,(unsigned long)s];
	}
}

-(NSString*)lengthString{
	
	if([SettingsManager sharedInstance].routeUnitisMiles==YES){
		float totalMiles = [[self length] floatValue]/1600;
		return [NSString stringWithFormat:@"%3.1f miles", totalMiles];
	}else {
		float	kms=[[self length] floatValue]/1000;
		return [NSString stringWithFormat:@"%4.1f km", kms];
	}
	
	
}



-(NSString*)lengthPercentStringForPercent:(float)percent{
	
	if([SettingsManager sharedInstance].routeUnitisMiles==YES){
		
		float milepercent=percent*[[self length] floatValue];
		float totalMiles = milepercent/1600;
		return [NSString stringWithFormat:@"%3.1f miles", totalMiles];
	}else {
		float	kms=[[self length] floatValue]/1000;
		float kmdistance=percent*kms;
		return [NSString stringWithFormat:@"%4.1f km", kmdistance];
	}
	
	
}




-(NSString*)speedString{
	
	NSNumber *kmSpeed = self.speed;
	if([SettingsManager sharedInstance].routeUnitisMiles==YES) {
		NSInteger mileSpeed = [[NSNumber numberWithDouble:([kmSpeed doubleValue] / 1.6)] integerValue];
		return [NSString stringWithFormat:@"%2ld mph", (long)mileSpeed];
	}else {
		return [NSString stringWithFormat:@"%@ km/h", kmSpeed];
	}
}

-(NSString*)dateString{
	
	NSDate *newdate=[NSDate dateFromString:[self date] withFormat:[NSDate dbFormatString]];
	return [NSDate stringFromDate:newdate withFormat:@"eee d MMMM y HH:mm"];
	
}

-(NSString*)dateOnlyString{
	
	NSDate *newdate=[NSDate dateFromString:[self date] withFormat:[NSDate dbFormatString]];
	return [NSDate stringFromDate:newdate withFormat:@"y-MM-dd 00:00:00"];
	
}

-(NSDate*)dateObject{
	
	return [NSDate dateFromString:[self date] withFormat:[NSDate dbFormatString]];
	
}

-(NSString*)planString{
	
	return [[self plan] capitalizedString];
	
}

-(NSString*)calorieString{
	
	if(self.calorie!=nil && ![self.calorie isEqualToString: EMPTYSTRING]){
		return [NSString stringWithFormat:@"%@ kcal",self.calorie];
	}else{
		return @"N/A";
	}
	
	
}
-(NSString*)coString{
	
	if(self.cosaved!=nil && ![self.cosaved isEqualToString:EMPTYSTRING]){
		return [NSString stringWithFormat:@"%@ gms",self.cosaved];
	}else{
		return @"N/A";
	}
	
}

-(NSURL*)csrouteurl{
	return [NSURL URLWithString:self.csiOSRouteurlString];
}


-(NSString*)csiOSRouteurlString{
	return [NSString stringWithFormat:@"cyclestreets://route/%@",self.routeID];
}
-(NSString*)csBrowserRouteurlString{
	return [NSString stringWithFormat:@"http://www.cyclestreets.net/journey/%@",self.routeID];
}

-(BOOL)containsWalkingSections{
	
	for (SegmentModel *segment in self.segments) {
		
		if(segment.isWalkingSection==YES)
			return YES;
	}
	return NO;
}



#pragma mark - waypoints

-(BOOL)hasWaypoints{
	return self.waypoints!=nil;
}

-(NSMutableArray*)createCorrectedWaypointArray{
	
	NSMutableArray *arr=[self.waypoints mutableCopy];
	
	if(arr.count>2){
		[arr exchangeObjectAtIndex:arr.count-1 withObjectAtIndex:1];
	}
	
	return arr;
	
}



#pragma mark - pois
-(BOOL)hasPOIs{
	return self.pois!=nil || self.pois.count!=0;
}



#pragma mark - Elevation

-(int)maxElevation{
	
	int value=0;
	
	for(SegmentModel *segment in self.segments){
		value=MAX(value, segment.segmentElevation);
	}
	return value;
}


-(BOOL)hasElevationData{
	
	SegmentModel *segment=self.segments.firstObject;
	return segment.elevations!=nil;
	
}





//
/***********************************************
 * @description			CL getters: note use of CLLocation so NSCoding is optimised.
 ***********************************************/
//

- (CLLocationCoordinate2D) basicNorthEast {
	CLLocationCoordinate2D location;
	location.latitude = self.nelatitudeValue;
	location.longitude = self.nelongitudeValue;
	return location;
}

- (CLLocationCoordinate2D) basicSouthWest {
	CLLocationCoordinate2D location;
	location.latitude = self.swlatitudeValue;
	location.longitude = self.swlongitudeValue;
	return location;
}

- (CLLocationCoordinate2D) insetNorthEast {
	CLLocationCoordinate2D location;
	location.latitude = self.nelatitudeValue;+0.002;
	location.longitude = self.nelongitudeValue;+0.002;
	return location;
}

- (CLLocationCoordinate2D) insetSouthWest {
	CLLocationCoordinate2D location;
	location.latitude = self.swlatitudeValue-0.002;
	location.longitude = self.swlongitudeValue-0.002;
	return location;
}


//
/***********************************************
 * @description			Mthods to create ne/sw bounding locations for 2 points
 ***********************************************/
//
-(CLLocationCoordinate2D)maxNorthEastForLocation:(CLLocation*)comparelocation{
	
	CLLocationCoordinate2D location;
	
	// compare n>n, max is lower
	double selflatitude=self.nelatitudeValue;
	double comparelatitude=comparelocation.coordinate.latitude;
	location.latitude=MAX(selflatitude, comparelatitude)+0.002;
	
	
	// compare e>e, max is higher
	double selflongtitude=self.nelongitudeValue;
	double comparelongtitude=comparelocation.coordinate.longitude;
	location.longitude=MAX(selflongtitude, comparelongtitude)+0.002;
	
	return location;
}


-(CLLocationCoordinate2D)maxSouthWestForLocation:(CLLocation*)comparelocation{
	
	CLLocationCoordinate2D location;
	
	
	// compare s>s, max is lower
	double selflatitude=self.swlatitudeValue;
	double comparelatitude=comparelocation.coordinate.latitude;
	location.latitude=MIN(selflatitude, comparelatitude)-0.006;
	
	
	// compare w>w, max is higher
	double selflongtitude=self.swlongitudeValue;
	double comparelongtitude=comparelocation.coordinate.longitude;
	location.longitude=MIN(selflongtitude, comparelongtitude)-0.002;
	
	return location;
}



-(NSString*)fileid{
	return [NSString stringWithFormat:@"%@_%@",self.routeID,self.plan];
}

@end
