//
//  LeisureViewController.m
//  CycleStreets
//
//  Created by Neil Edwards on 26/10/2014.
//  Copyright (c) 2014 CycleStreets Ltd. All rights reserved.
//

#import "LeisureViewController.h"
#import "RouteManager.h"
#import "LeisureRouteVO.h"

#import <CoreLocation/CoreLocation.h>

@interface LeisureViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl		*typeControl;

@property (weak, nonatomic) IBOutlet UISlider				*unitControl;
@property (weak, nonatomic) IBOutlet UILabel				*startLabel;
@property (weak, nonatomic) IBOutlet UILabel				*endLabel;
@property (weak, nonatomic) IBOutlet UILabel				*readoutLabel;


@property (weak, nonatomic) IBOutlet UIButton				*currentButton;
@property (weak, nonatomic) IBOutlet UIButton				*mapButton;
@property (weak, nonatomic) IBOutlet UIButton				*savedButton;


@property (weak, nonatomic) IBOutlet UIButton				*calculateButton;



// state
@property (nonatomic,strong) LeisureRouteVO					*dataProvider;



@end

@implementation LeisureViewController


#pragma mark UIView

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self createPersistentUI];
}

-(void)createPersistentUI{
	
	NSArray *typeArr=[LeisureRouteVO routeTypesStrings];
	[_typeControl removeAllSegments];
	[typeArr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
		[_typeControl insertSegmentWithTitle:obj atIndex:idx animated:NO];
	}];
	
	_unitControl.minimumValue=0;
	_unitControl.minimumValue=100;
	_unitControl.value=50;
	
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self createNonPersistentUI];
    
    [super viewWillAppear:animated];
}


-(void)createNonPersistentUI{
    
    
	
	
    
}


-(void)updateUIForTypeChange{
	
	NSArray *typeRangeArray=[LeisureRouteVO typeRangeArrayForRouteType:_dataProvider.routeType];
	_startLabel.text=[NSString stringWithFormat:@"%@",typeRangeArray[0]];
	_endLabel.text=[NSString stringWithFormat:@"%@",typeRangeArray[1]];
	
	[self updateUIForUnitChange];
	
}

-(void)updateUIForUnitChange{
	
	_readoutLabel.text=[_dataProvider readoutString];
	
}


#pragma mark - unit UI

-(IBAction)didChangeTypeControl:(id)sender{
	
	[_dataProvider changeRouteType:_typeControl.selectedSegmentIndex];
	
	[self updateUIForTypeChange];
	
}



#pragma mark - Slider UI

-(IBAction)didUpdateValueSlider:(id)sender{
	
	_dataProvider.routeValue=_unitControl.value;
    
	[self updateUIForUnitChange];
	
}


#pragma mark - UI Events


-(IBAction)didSelectCurrentLocationButton:(id)sender{
    
    // use current gps location
    
}

-(IBAction)didSelectMapButton:(id)sender{
    
   // use current map center location
    
}

-(IBAction)didSelectSavedLocationButton:(id)sender{
    
    // show saved location view
    
}



#pragma mark - View action

-(BOOL)validate{
    
    
    
    return YES;
}


-(IBAction)didSelectCalculateButton:(id)sender{
    
    if([self validate]){
        
        
        
    }
}




@end
