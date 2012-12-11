### GKImagePicker

Ever wanted a custom crop area for the UIImagePickerController? Now you can have it with _GKImagePicker_. Just set your custom crop area and that's it. Just 4 lines of code. If you don't set it, it uses the same crop area as the default UIImagePickerController.

### How to use it

- just drag and drop the files in under "GKClasses" & "GKImages" into your project.
- look at the sample code below.
- this project contains a sample project as well, just have a look at the implementation of `ViewController.m` 
- have fun and follow [@gekitz](http://www.twitter.com/gekitz).


### Sample Code
	
	self.imagePicker = [[GKImagePicker alloc] init];
    self.imagePicker.cropSize = CGSizeMake(320, 90);
    self.imagePicker.delegate = self;
    
     [self presentModalViewController:self.imagePicker.imagePickerController animated:YES];
     

This code results into the following controller + crop area:

![Sample Crop Image](https://dl.dropbox.com/u/311618/GKImageCrop/IMG_1509.PNG)

It's even possible to let the user adjust the crop area (thanks to [@pathonhauser](http://www.twitter.com/pathonhauser) for this pull request) by setting one additional property:
	
	self.imagePicker.resizeableCropArea = YES;
     
This code results into the following controller + adjustable crop area:
![Sample Crop Image Adjustable](https://dl.dropbox.com/u/311618/GKImageCrop/IMG_2299.PNG)
### License
Under MIT. See license file for details.



    