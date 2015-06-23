#import "_SegmentModel.h"

@interface SegmentModel : _SegmentModel {}


// getters

-(NSString*)				timeString;

-(CLLocationCoordinate2D)	segmentStart;
-(CLLocationCoordinate2D)	segmentEnd;

-(NSString*)				provisionIcon;
-(NSDictionary*)			infoStringDictionary;


-(BOOL)						isWalkingSection;
-(int)						segmentElevation;
-(int)						maxElevation;


// methods

// return array of allpoints for this segment
- (NSArray *)allPoints;


- (NSString *) infoString;

+(NSString*)provisionIconForType:(NSString*)type isWalking:(int)walking;// legacy support for walking
+(NSString*)iconForType:(NSString*)type;

-(CLLocationCoordinate2D)maxNorthEastForLocation:(CLLocation*)comparelocation;
-(CLLocationCoordinate2D)maxSouthWestForLocation:(CLLocation*)comparelocation;


@end
