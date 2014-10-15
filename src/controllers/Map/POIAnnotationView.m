//
//  POIAnnotationView.m
//  CycleStreets
//
//  Created by Neil Edwards on 15/10/2014.
//  Copyright (c) 2014 CycleStreets Ltd. All rights reserved.
//

#import "POIAnnotationView.h"
#import "UIView+Additions.h"
#import "POIAnnotation.h"
#import "ImageCache.h"

@interface POIAnnotationView()

@property (nonatomic,strong)  UILabel							*indexLabel;


@end

@implementation POIAnnotationView


- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	
	if (self) {
		
		[self updateAnnotation];
		
		self.centerOffset=CGPointMake(12, 0-self.height/2);
		
		self.calloutOffset=CGPointMake(-12, 0);
		
	}
	
	return self;
}


-(void)setAnnotation:(id<MKAnnotation>)_annotation{
	
	[super setAnnotation:_annotation];
	
	[self updateAnnotation];
}


-(void)updateAnnotation{
	
	
	POIAnnotation* annotation=self.annotation;
	
	self.image=[[ImageCache sharedInstance] imageExists:[NSString stringWithFormat:@"Icon_POI_%@",annotation.dataProvider.poiType] ofType:nil];
	
	
}

@end
