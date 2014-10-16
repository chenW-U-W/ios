//
//  SaveLocationCreateViewController.m
//  CycleStreets
//
//  Created by Neil Edwards on 16/10/2014.
//  Copyright (c) 2014 CycleStreets Ltd. All rights reserved.
//

#import "SaveLocationCreateViewController.h"
#import "GenericConstants.h"
#import "BUHorizontalMenuView.h"
#import "AppConstants.h"
#import "UIView+Additions.h"
#import "SavedLocationVO.h"
#import "SavedLocationsManager.h"

@interface SaveLocationMenuView : UIView<BUHorizontalMenuItem>

@property (nonatomic,strong)  UIImageView						*iconView;
@property (nonatomic,strong)  UILabel							*iconLabel;

@property (nonatomic,strong)  NSDictionary                      *dataProvider;

@end

@implementation SaveLocationMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		
	}
	return self;
}


-(void)setDataProvider:(NSDictionary*)data{
	
	if(_dataProvider!=data){
		_dataProvider=data;
		
		[self populate];
		
	}
	
}

-(void)layoutSubviews{
	
	[super layoutSubviews];
	
}


-(void)create{
	
	self.iconView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 30, 30)];
	[self addSubview:_iconView];
	self.iconLabel=[[UILabel alloc]initWithFrame:CGRectMake(_iconView.x, _iconView.y+3, _iconView.width, 17)];
	[self addSubview:_iconLabel];
	
}


-(void)populate{
	
	_iconLabel.text=_dataProvider[@"title"];
	_iconView.image=[UIImage imageNamed:[SavedLocationVO imageForLocationType:(SavedLocationType)_dataProvider[@"image"]]];
	
}


-(void)setTouchBlock:(GenericEventBlock)block{
	
	
	
}

-(void)setSelected:(BOOL)selected{
	
}


@end


@interface SaveLocationCreateViewController()<BUHorizontalMenuDataSource,BUHorizontalMenuDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField			*nameField;
@property (weak, nonatomic) IBOutlet UIButton				*cancelButton;
@property (weak, nonatomic) IBOutlet UIButton				*saveButton;

@property (weak, nonatomic) IBOutlet BUHorizontalMenuView	*iconMenuView;

@property (nonatomic,strong)  NSArray						*savedLocationDataProvider;


@end

@implementation SaveLocationCreateViewController



//
/***********************************************
 * @description		NOTIFICATIONS
 ***********************************************/
//

-(void)listNotificationInterests{
	
	
	
	[super listNotificationInterests];
	
}

-(void)didReceiveNotification:(NSNotification*)notification{
	
	
	
}


//
/***********************************************
 * @description			VIEW METHODS
 ***********************************************/
//

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.savedLocationDataProvider=[SavedLocationVO locationTypeDataProvider];
	
	_nameField.delegate=self;
	
	_saveButton.enabled=NO;
	
	[self createPersistentUI];
}


-(void)viewWillAppear:(BOOL)animated{
	
	[self createNonPersistentUI];
	
	[super viewWillAppear:animated];
}


-(void)createPersistentUI{
	
}

-(void)createNonPersistentUI{
	
	
	
}


#pragma mark - CSOverlayTransitionProtocol

-(void)didDismissWithTouch:(UITapGestureRecognizer*)gestureRecogniser{
	
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

-(CGSize)sizeToPresent{
	
	return CGSizeMake(280,260);
}


#pragma mark - BUHorizontalMenuView

- (NSInteger) numberOfItemsForMenu:(BUHorizontalMenuView*) menuView{
	return _savedLocationDataProvider.count;
}


- (NSDictionary*) horizMenu:(BUHorizontalMenuView*) menuView itemAtIndex:(NSInteger) index{
	
	return _savedLocationDataProvider[index];
	
}


- (UIView<BUHorizontalMenuItem>*)menuViewItemForIndex:(NSInteger) index{
	
	SaveLocationMenuView *itemView=[[SaveLocationMenuView alloc]initWithFrame:CGRectMake(0, 0, 50, 70)];
	
	[itemView setDataProvider:_savedLocationDataProvider[index]];
	
	return itemView;
	
}



- (void)horizMenu:(BUHorizontalMenuView*) menuView itemSelectedAtIndex:(NSInteger) index{
	
	NSDictionary *itemData=_savedLocationDataProvider[index];
	
	_dataProvider.locationType=(SavedLocationType)itemData[@"type"];
	_dataProvider.title=itemData[@"title"];
	
	[self validate];
	
}


#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	
	[textField resignFirstResponder];
	
	return NO;
}


- (IBAction)fieldChanged:(id)sender {
	
	_dataProvider.title=_nameField.text;
	
	[self validate];
	
}


#pragma mark - validation

-(BOOL)isValid{
	
	BOOL valid=YES;
	
	if(_nameField.text.length<2)
		valid=NO;
	
	if(!_dataProvider.isValid)
		valid=NO;
	   
	return valid;
	
}

-(void)validate{
	
	BOOL isValid=[self isValid];
	
	_saveButton.enabled=isValid;
	
}


#pragma mark - UI Events

//
/***********************************************
 * @description			UI EVENTS
 ***********************************************/
//

-(IBAction)didSelectCancelButton:(id)sender{
	
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

-(IBAction)didSelectSaveButton:(id)sender{
	
	[[SavedLocationsManager sharedInstance] addSavedLocation:_dataProvider];
	
}


//
/***********************************************
 * @description			MEMORY
 ***********************************************/
//
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	
}


- (IBAction)cancelButton:(id)sender {
}
@end
