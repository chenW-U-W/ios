#import "_POILocationModel.h"
#import "POILocationVO.h"

@interface POILocationModel : _POILocationModel {}


-(CLLocationCoordinate2D) coordinate;


-(void)populateWithLegacyObject:(POILocationVO*)legacyObject;

@end
