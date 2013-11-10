//
//  GKImageCropViewController.m
//  GKImagePicker
//
//  Created by Georg Kitz on 6/1/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import "GKImageCropViewController.h"
#import "GKImageCropView.h"

#define HORIZONTAL_TEXT_PADDING 13.f

@interface GKImageCropViewController ()

@property (nonatomic, strong) GKImageCropView *imageCropView;
@property (nonatomic, strong) UIView *toolbarView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *useButton;

- (void)_actionCancel;
- (void)_actionUse;
- (void)_setupNavigationBar;
- (void)_setupCropView;

@end

@implementation GKImageCropViewController

#pragma mark -
#pragma mark Getter/Setter

@synthesize sourceImage, cropSize, delegate;
@synthesize imageCropView;
@synthesize toolbarView;
@synthesize cancelButton, useButton, resizeableCropArea;

#pragma mark -
#pragma Private Methods


- (void)_actionCancel{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)_actionUse{
    _croppedImage = [self.imageCropView croppedImage];
    [self.delegate imageCropController:self didFinishWithCroppedImage:_croppedImage];
}


- (void)_setupNavigationBar{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                                                                          target:self 
                                                                                          action:@selector(_actionCancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"GKIuse", @"") 
                                                                              style:UIBarButtonItemStyleBordered 
                                                                             target:self 
                                                                             action:@selector(_actionUse)];
}


- (void)_setupCropView{
    
    self.imageCropView = [[GKImageCropView alloc] initWithFrame:self.view.bounds];
    [self.imageCropView setImageToCrop:sourceImage];
    [self.imageCropView setResizableCropArea:self.resizeableCropArea];
    [self.imageCropView setCropSize:cropSize];
    [self.view addSubview:self.imageCropView];
}

- (CGSize)sizeForString:(NSString *)string withFont:(UIFont *)font{
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    attributes[NSFontAttributeName] = font;
    CGRect labelRect = [string boundingRectWithSize:CGSizeMake(320.f, TOOLBAR_HEIGHT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributes
                                            context:nil];
    return CGSizeMake(labelRect.size.width, TOOLBAR_HEIGHT);
}

- (UIFont *)buttonFont
{
    return  [UIFont systemFontOfSize:18.f];
}

- (void)_setupCancelButton{
    CGSize buttonSize = [self sizeForString:NSLocalizedString(@"GKIcancel",@"")
                                   withFont:[self buttonFont]];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [[self.cancelButton titleLabel] setFont:[self buttonFont]];
    [self.cancelButton setFrame:CGRectMake(HORIZONTAL_TEXT_PADDING, 0, buttonSize.width, buttonSize.height)];
    [self.cancelButton setTitle:NSLocalizedString(@"GKIcancel",@"") forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlEventAllEvents];
    [self.cancelButton  addTarget:self action:@selector(_actionCancel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)_setupUseButton{
    CGSize buttonSize = [self sizeForString:NSLocalizedString(@"GKIuse",@"")
                                   withFont:[self buttonFont]];
    
    self.useButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [[self.useButton titleLabel] setFont:[self buttonFont]];
    [self.useButton setFrame:CGRectMake(self.view.frame.size.width - (buttonSize.width + HORIZONTAL_TEXT_PADDING), 0, buttonSize.width, buttonSize.height)];
    [self.useButton setTitle:NSLocalizedString(@"GKIuse",@"") forState:UIControlStateNormal];
    [self.useButton setTitleColor:[UIColor whiteColor] forState:UIControlEventAllEvents];
    [self.useButton  addTarget:self action:@selector(_actionUse) forControlEvents:UIControlEventTouchUpInside];
}


- (void)_setupToolbar{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        self.toolbarView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                   self.view.frame.size.height - TOOLBAR_HEIGHT,
                                                                   self.view.frame.size.width,
                                                                   TOOLBAR_HEIGHT)];
        self.toolbarView.backgroundColor = [UIColor colorWithRed:20./255. green:20./255. blue:20./255. alpha:0.65];
        [self.view addSubview:self.toolbarView];
        
        [self _setupCancelButton];
        [self _setupUseButton];
        
        [self.toolbarView addSubview:self.cancelButton];
        [self.toolbarView addSubview:self.useButton];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark -
#pragma Super Class Methods

- (id)init{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = NSLocalizedString(@"GKIchoosePhoto", @"");

    [self _setupNavigationBar];
    [self _setupCropView];
    [self _setupToolbar];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self.navigationController setNavigationBarHidden:YES];
    } else {
		[self.navigationController setNavigationBarHidden:NO];
	}
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.imageCropView.frame = self.view.bounds;
    self.toolbarView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - TOOLBAR_HEIGHT, 320, TOOLBAR_HEIGHT);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
