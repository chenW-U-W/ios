//
//  LeisureRouteVO.m
//  CycleStreets
//
//  Created by Neil Edwards on 26/10/2014.
//  Copyright (c) 2014 CycleStreets Ltd. All rights reserved.
//

#import "LeisureRouteVO.h"

#import "SettingsManager.h"

static NSString *const RouteTypeDuration=@"Duration";
static NSString *const RouteTypeDistance=@"Distance";



@implementation LeisureRouteVO


- (instancetype)init
{
	self = [super init];
	if (self) {
		_routeType=LeisureRouteTypeDuration;
		_routeValue=0;
		
	}
	return self;
}


-(LeisureRouteType)changeRouteType:(NSInteger)index{
	
	_routeType=(LeisureRouteType)[LeisureRouteVO routeTypes][index];
	
	return _routeType;
	
}


// Note this should be based on percentage of slider
-(NSString*)readoutString{
	
	NSArray *valueRange=[LeisureRouteVO typeRangeArrayForRouteType:_routeType];
	
	if(_routeType==LeisureRouteTypeDuration){
		
		int actualValue=(_routeValue/100) * [valueRange[1] intValue];
		
		return [NSString stringWithFormat:@"%i %@",actualValue,[[SettingsManager sharedInstance] routeUnitisMiles] ? @"m":@"km"];
	}else{
		return [NSString stringWithFormat:@"%i mins",_routeValue];
	}
	
}



-(BOOL)isValid{
	
	return YES;
}

-(BOOL)validateValues{
	
	
	return YES;
}



#pragma mark - dataProviders

+(NSArray*)routeTypesStrings{
	return @[RouteTypeDuration,RouteTypeDistance];
}

+(NSArray*)routeTypes{
	return @[@(LeisureRouteTypeDuration),@(LeisureRouteTypeDistance)];
}

+(NSDictionary*)endPointsForRouteType:(LeisureRouteType)type{
	
	
	return @{};
}


+(NSArray*)typeRangeArrayForRouteType:(LeisureRouteType)type{
	
	if(type==LeisureRouteTypeDistance){
		return @[@(1),@(20)];
	}else{
		return @[@(1),@(120)];
	}
	
}



@end
