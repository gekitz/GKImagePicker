//
//  GKImageCropOverlayView.m
//  GKImagePicker
//
//  Created by Georg Kitz on 6/1/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import "GKImageCropOverlayView.h"
#import "GKImageCropView.h"

@interface GKImageCropOverlayView ()
@property (nonatomic, strong) UIToolbar *toolbar;
@end

@implementation GKImageCropOverlayView

#pragma mark -
#pragma Getter/Setter

@synthesize cropSize;
@synthesize toolbar;

#pragma mark -
#pragma Overriden

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect{
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGFloat heightSpan = floor(height / 2 - self.cropSize.height / 2);
    CGFloat widthSpan = floor(width / 2 - self.cropSize.width  / 2);
    
    //fill outer rect
    [[UIColor colorWithRed:0. green:0. blue:0. alpha:0.5] set];
    UIRectFill(self.bounds);
    
    //fill inner border
    [[UIColor colorWithRed:1. green:1. blue:1. alpha:0.5] set];
//    UIRectFrame(CGRectMake(widthSpan - 2, heightSpan - 2, self.cropSize.width + 4, self.cropSize.height + 4));
    UIRectFrame(CGRectMake(widthSpan, heightSpan, self.cropSize.width, self.cropSize.height));
    
    //fill inner rect
    [[UIColor clearColor] set];
//    UIRectFill(CGRectMake(widthSpan + 2, heightSpan + 2, self.cropSize.width - 4, self.cropSize.height - 4));
    UIRectFill(CGRectMake(widthSpan + 1, heightSpan + 1, self.cropSize.width - 2, self.cropSize.height - 2));
    
    
    
    if (heightSpan > 30 && (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
        
        [[UIColor whiteColor] set];
        [NSLocalizedString(@"Move and Scale", @"Move and Scale") drawInRect:CGRectMake(10, (height - heightSpan) + (heightSpan / 2 - 20 / 2) , width - 20, 20) 
                                                   withFont:[UIFont boldSystemFontOfSize:20] 
                                              lineBreakMode:NSLineBreakByTruncatingTail
                                                  alignment:NSTextAlignmentCenter];
        
    }
}

@end

