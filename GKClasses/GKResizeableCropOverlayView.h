//
//  GKResizeableView.h
//  GKImagePicker
//
//  Created by Patrick Thonhauser on 9/21/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKCropBorderView.h"
#import "GKImageCropOverlayView.h"

typedef struct {
    int widhtMultiplyer;
    int heightMultiplyer;
    int xMultiplyer;
    int yMultiplyer;
}GKResizeableViewBorderMultiplyer;

@interface GKResizeableCropOverlayView : GKImageCropOverlayView

@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong, readonly) GKCropBorderView *cropBorderView;

/**
 call this method to create a resizable crop view
 @param frame
 @param initial crop size
 @return crop view instance
 */
-(id)initWithFrame:(CGRect)frame andInitialContentSize:(CGSize)contentSize;

@end
