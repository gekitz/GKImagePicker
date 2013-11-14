Pod::Spec.new do |s|
  s.name           =  'AKImagePicker'
  s.version        =  '0.0.1'
  s.license        =  'MIT'
  s.platform       =  :ios, '7.0'
  s.summary        =  'Image Picker with support for custom crop areas.'
  s.description    =  'A fork of GKImagePicker updated for iOS 7.'
  s.homepage       =  'https://github.com/arkuana/AKImagePicker'
  s.author         =  { 'Georg Kitz' => 'info@aurora-apps.com' }
  s.source         =  { :git => 'https://github.com/arkuana/AKImagePicker.git' }
  s.resources      =  'GKImages/*.png'
  s.source_files   =  'GKClasses/*.{h,m}'
  s.preserve_paths =  'GKClasses', 'GKImages'
  s.frameworks     =  'UIKit'
  s.requires_arc   =  true
end
