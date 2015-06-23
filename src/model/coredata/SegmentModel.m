#import "SegmentModel.h"
#import "WaypointModel.h"
#import "CSPointVO.h"
#import "NSManagedObject+BUCoreData.h"

static NSDictionary *roadIcons;

@interface SegmentModel ()

@property(nonatomic,strong)  NSDictionary         *stringDictionary;

@end


@implementation SegmentModel


//
/***********************************************
 * @description			getters
 ***********************************************/
//


-(NSString*)timeString{
	
	NSUInteger h = self.startTimeValue / 3600;
	NSUInteger m = (self.startTimeValue / 60) % 60;
	NSUInteger s = self.startTimeValue % 60;
	
	if (self.startTimeValue>3600) {
		return [NSString stringWithFormat:@"%02lu:%02lu:%02lu", (unsigned long)h,(unsigned long)m,(unsigned long)s];
	}else {
		return [NSString stringWithFormat:@"%02lu:%02lu", (unsigned long)m,(unsigned long)s];
	}
}

// locations

- (CLLocationCoordinate2D)segmentStart {
	WaypointModel *point=[self.pointArray objectAtIndex:0];
	return [point  coordinate];
}

- (CLLocationCoordinate2D)segmentEnd {
	return [(WaypointModel*)[self.pointArray objectAtIndex:[self.pointArray count]-1] coordinate];
}


// provision icons

+(NSString*)provisionIconForType:(NSString*)type isWalking:(int)walking{
	
	if(walking==1){
		
		return @"UIIcon_walking.png";
		
	}else{
		return [SegmentModel iconForType:[type lowercaseString]];
	}
	
}

- (NSString *)provisionIcon {
	
	if([self isWalkingSection]==YES){
		
		return @"UIIcon_walking.png";
		
	}else{
		return [SegmentModel iconForType:[self.provisionName lowercaseString]];
	}
	
}

+(NSString*)iconForType:(NSString*)type{
	
	if (nil == roadIcons) {
		//TODO the association of symbols to types could be improved
		roadIcons = [NSDictionary dictionaryWithObjectsAndKeys:
					 @"UIIcon_roads.png", @"busy road",
					 @"UIIcon_roads.png", @"road",
					 @"UIIcon_roads.png", @"busy and fast road",
					 @"UIIcon_roads.png", @"secondary",
					 @"UIIcon_roads.png", @"major road",
					 @"UIIcon_roads.png", @"main road",
					 @"UIIcon_roads.png", @"trunk road",
					 @"UIIcon_roads.png", @"unclassified road",
					 @"UIIcon_minor_roads.png", @"minor road",
					 @"UIIcon_minor_roads.png", @"service road",
					 @"UIIcon_footpaths.png", @"footpath",
					 @"UIIcon_footpaths.png", @"footway",
					 @"UIIcon_footpaths.png", @"pedestrian",
					 @"UIIcon_footpaths.png", @"pedestrianized area",
					 @"UIIcon_footpaths.png", @"steps with channel",
					 @"UIIcon_cycle_lanes.png", @"unsegregated shared use",
					 @"UIIcon_cycle_lanes.png", @"narrow cycle lane",
					 @"UIIcon_cycle_lanes.png", @"cycle lane",
					 @"UIIcon_cycle_tracks.png", @"cycle track",
					 @"UIIcon_cycle_tracks.png", @"cycle path",
					 @"UIIcon_tracks.png", @"track",
					 @"UIIcon_tracks.png", @"bridleway",
					 @"UIIcon_quiet_street.png", @"quiet street",
					 @"UIIcon_quiet_street.png", @"residential street",
					 @"UIIcon_quiet_street.png", @"unclassified, service", // need icon for this
					 @"UIIcon_quiet_street.png", @"unclassified,service",
					 nil];
	}
	
	return [roadIcons valueForKey:type];
	
	
}


// UI strings

-(void)populateStringDictionary{
	
	NSString *hm = [self timeString];
	NSString *distance = [NSString stringWithFormat:@"%lim", (long)[self segmentDistance]];
	float totalMiles = ((float)([self startDistanceValue]+[self segmentDistanceValue]))/1600;
	NSString *total = [NSString stringWithFormat:@"%3.1f miles", totalMiles];
	
	NSArray *turnParts = [[self turnType] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	NSString *capitalizedTurn = @"";
	for (NSString *string in turnParts) {
		if ([capitalizedTurn length] == 0) {
			capitalizedTurn = [string capitalizedString];
		} else {
			capitalizedTurn = [capitalizedTurn stringByAppendingFormat:@" %@", string];
		}
	}
	
	NSString *provisionstring=[[self provisionName] stringByReplacingOccurrencesOfString:@"," withString:@", "];
	
	if ([turnParts count] ==0 || [capitalizedTurn isEqualToString:@"Unknown"]) {
		
		self.stringDictionary=[NSDictionary dictionaryWithObjectsAndKeys:[self roadName],@"roadname",
						   provisionstring,@"provisionName",
						   hm,@"hm",distance,@"distance",total,@"total",nil];
	} else {
		
		self.stringDictionary=[NSDictionary dictionaryWithObjectsAndKeys:capitalizedTurn,@"capitalizedTurn",
						   [self roadName],@"roadname",
						   provisionstring,@"provisionName",
						   hm,@"hm",distance,@"distance",total,@"total",nil];
	}
	
	
}

-(NSDictionary*)infoStringDictionary{
	
	if(self.stringDictionary==nil)
		[self populateStringDictionary];
	
	return self.stringDictionary;
	
}


-(BOOL)isWalkingSection{
	return self.walkValueValue==1;
}



-(int)segmentElevation{
	
	NSMutableArray *earray=[[self.elevations componentsSeparatedByString:@","] mutableCopy];
	
	if(earray.count>1){
		
		[earray removeLastObject];
		for(int i=0;i<earray.count;i++){
			NSString *str=earray[i];
			int value=[str intValue];
			[earray replaceObjectAtIndex:i withObject:@(value)];
		}
		
		return [[earray valueForKeyPath:@"@avg.self"] intValue];
	}else{
		return [earray[0] intValue];
	}
}



#pragma mark - Methods


- (NSArray *)allPoints{
	return self.pointArray.array;
}


- (NSString *) infoString{
	
	
	
}


// locations

-(CLLocationCoordinate2D)northEast{
	
	CLLocationCoordinate2D start = [self segmentStart];
	CLLocationCoordinate2D end = [self segmentEnd];
	CLLocationCoordinate2D ne;
	if (start.latitude < end.latitude) {
		ne.latitude = end.latitude;
	} else {
		ne.latitude = start.latitude;
	}
	if (start.longitude < end.longitude) {
		ne.longitude = end.longitude;
	} else {
		ne.longitude = start.longitude;
	}
	
	return ne;
	
}


-(CLLocationCoordinate2D)southWest{
	
	CLLocationCoordinate2D start = [self segmentStart];
	CLLocationCoordinate2D end = [self segmentEnd];
	CLLocationCoordinate2D sw;
	if (start.latitude < end.latitude) {
		sw.latitude = start.latitude;
	} else {
		sw.latitude = end.latitude;
	}
	if (start.longitude < end.longitude) {
		sw.longitude = start.longitude;
	} else {
		sw.longitude = end.longitude;
	}
	
	return sw;
}



//
/***********************************************
 * @description			Mthods to create ne/sw bounding locations for 2 points
 ***********************************************/
//
-(CLLocationCoordinate2D)maxNorthEastForLocation:(CLLocation*)comparelocation{
	
	CLLocationCoordinate2D location;
	
	CLLocationCoordinate2D ne=self.northEast;
	
	// compare n>n, max is lower
	double selflatitude=ne.latitude;
	double comparelatitude=comparelocation.coordinate.latitude;
	location.latitude=MAX(selflatitude, comparelatitude)+0.002;
	
	
	// compare e>e, max is higher
	double selflongtitude=ne.longitude;
	double comparelongtitude=comparelocation.coordinate.longitude;
	location.longitude=MAX(selflongtitude, comparelongtitude)+0.002;
	
	return location;
}


-(CLLocationCoordinate2D)maxSouthWestForLocation:(CLLocation*)comparelocation{
	
	CLLocationCoordinate2D location;
	
	CLLocationCoordinate2D sw=self.southWest;
	
	// compare s>s, max is lower
	double selflatitude=sw.latitude;
	double comparelatitude=comparelocation.coordinate.latitude;
	location.latitude=MIN(selflatitude, comparelatitude)-0.006;
	
	
	// compare w>w, max is higher
	double selflongtitude=sw.longitude;
	double comparelongtitude=comparelocation.coordinate.longitude;
	location.longitude=MIN(selflongtitude, comparelongtitude)-0.002;
	
	return location;
}



#pragma mark - legacy migration


-(void)populateWithLegacyObject:(SegmentVO*)legacyObject{
	
	// simple properties
	self.roadName=[legacyObject.roadName copy];
	self.provisionName=[legacyObject.provisionName copy];
	self.turnType=[legacyObject.turnType copy];
	self.walkValue=@(legacyObject.walkValue);
	self.segmentTime=@(legacyObject.segmentTime);
	self.segmentDistance=@(legacyObject.segmentDistance);
	self.startBearing=@(legacyObject.startBearing);
	self.segmentBusynance=@(legacyObject.segmentBusynance);
	self.startTime=@(legacyObject.startTime);
	self.startDistance=@(legacyObject.startDistance);
	
	
	// relationships
	
	for(CSPointVO *point in legacyObject.pointsArray){
		
		WaypointModel *newwaypoint=[WaypointModel create];
		[newwaypoint populateWithLegacyObject:point];
		[self addPointArrayObject:newwaypoint];
		
	}
	
	
}


@end
