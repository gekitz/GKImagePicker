//
//  ViewController.m
//  GKImagePicker
//
//  Created by Georg Kitz on 6/1/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import "ViewController.h"
#import "GKImagePicker.h"

@interface ViewController ()<GKImagePickerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) GKImagePicker *imagePicker;
@property (nonatomic, strong) UIPopoverController *popoverController;
@property (nonatomic, strong) UIImagePickerController *ctr;

@property (nonatomic, strong) UIButton *customCropButton;
@property (nonatomic, strong) UIButton *normalCropButton;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIButton* resizableButton;
@end

@implementation ViewController

@synthesize imagePicker;
@synthesize imgView;
@synthesize popoverController;
@synthesize ctr;
@synthesize customCropButton, normalCropButton, resizableButton;

- (void)showPicker:(UIButton *)btn{
    
    self.imagePicker = [[GKImagePicker alloc] init];
    self.imagePicker.cropSize = CGSizeMake(320, 320);
    self.imagePicker.delegate = self;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        self.popoverController = [[UIPopoverController alloc] initWithContentViewController:self.imagePicker.imagePickerController];
        [self.popoverController presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        
        [self presentModalViewController:self.imagePicker.imagePickerController animated:YES];
        
    }
}

- (void)showNormalPicker:(UIButton *)btn{
    self.ctr = [[UIImagePickerController alloc] init];
    self.ctr.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.ctr.delegate = self;
    self.ctr.allowsEditing = YES;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        self.popoverController = [[UIPopoverController alloc] initWithContentViewController:self.ctr];
        [self.popoverController presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        
        [self presentModalViewController:self.ctr animated:YES];
        
    }
    
}

-(void)showResizablePicker:(UIButton*)btn{
    self.imagePicker = [[GKImagePicker alloc] init];
    self.imagePicker.cropSize = CGSizeMake(296, 300);
    self.imagePicker.delegate = self;
	self.imagePicker.resizeableCropArea = YES;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        self.popoverController = [[UIPopoverController alloc] initWithContentViewController:self.imagePicker.imagePickerController];
        [self.popoverController presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        
        [self presentModalViewController:self.imagePicker.imagePickerController animated:YES];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.customCropButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGFloat buttonWidth = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 220 : 280;
    self.customCropButton.frame = CGRectMake(20, 20, buttonWidth, 44);
    [self.customCropButton setTitle:@"Custom Crop" forState:UIControlStateNormal];
    [self.customCropButton addTarget:self action:@selector(showPicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.customCropButton];
    
    self.normalCropButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.normalCropButton setTitle:@"Normal Crop" forState:UIControlStateNormal];
    [self.normalCropButton addTarget:self action:@selector(showNormalPicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.normalCropButton];
    
    self.resizableButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.resizableButton setTitle:@"Resizeable Custom Crop" forState:UIControlStateNormal];
    [self.resizableButton addTarget:self action:@selector(showResizablePicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resizableButton];
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.imgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.imgView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.normalCropButton.frame = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 
                                   CGRectMake(260, 20, 220, 44) :
                                   CGRectMake(20, CGRectGetMaxY(self.customCropButton.frame) + 20, 280, 44));
    
    self.resizableButton.frame = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ?
                                   CGRectMake(500, 20, 220, 44) :
                                   CGRectMake(20, CGRectGetMaxY(self.normalCropButton.frame) + 20, 280, 44));
    
    self.imgView.frame = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 
                          CGRectMake(20, 84, CGRectGetWidth(self.view.bounds) - 40, CGRectGetHeight(self.view.bounds) - 104) : 
                          CGRectMake(20, CGRectGetMaxY(self.resizableButton.frame) + 20, CGRectGetWidth(self.view.bounds) - 40, CGRectGetHeight(self.view.bounds) - 20 - (CGRectGetMaxY(self.resizableButton.frame) + 20) ));
}

# pragma mark -
# pragma mark GKImagePicker Delegate Methods

- (void)imagePicker:(GKImagePicker *)imagePicker pickedImage:(UIImage *)image{
    self.imgView.image = image;
    [self hideImagePicker];
}

- (void)hideImagePicker{
    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM()) {
        
        [self.popoverController dismissPopoverAnimated:YES];
        
    } else {
        
        [self.imagePicker.imagePickerController dismissViewControllerAnimated:YES completion:nil];
        
    }
}

# pragma mark -
# pragma mark UIImagePickerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    self.imgView.image = image;

    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM()) {
        
        [self.popoverController dismissPopoverAnimated:YES];
        
    } else {
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }
}

@end
