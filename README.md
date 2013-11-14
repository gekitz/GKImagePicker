### GKImagePicker 

A fork of [GKImagePicker](https://github.com/gekitz/GKImagePicker) by [@gekitz](http://www.twitter.com/gekitz), taking off in a slightly different tangent. Notable changes to it are:
- Utilizes an image cropper similar to Apple's own iOS 7 redesign
- Uses the available space of the screen as much as possible regardless of the size of the image being cropped. Also ensures that large crop sizes are scaled to still fit in the screen.

### How to use it

- Follow the instructions found [here](https://github.com/gekitz/GKImagePicker).

### Sample Code

    self.imagePicker = [[GKImagePicker alloc] init];
    self.imagePicker.cropSize = CGSizeMake(320, 496);
    self.imagePicker.delegate = self;
    
    [self.imagePicker showActionSheetOnViewController:self onPopoverFromView:btn];

### License
Under MIT. See license file for details.



    
