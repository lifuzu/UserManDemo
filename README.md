Demo Parse Functions Using Swift/iOS 8/Xcode 6 Beta 5
======

### Functions Supported:
User Management: Register | Sign In | Sign Out | Reset password


### Here is the steps you need to run before opening the project/workspace:
*1*. Download Parse SDK
```
https://www.parse.com/downloads/ios/parse-library/latest
```
*2*. Add the SDK to your app
Drag the Parse.framework folder you downloaded into your Xcode project folder target.
Make sure the "Copy items to destination's group folder" checkbox is checked.

*3*. Add the dependencies:
Click on Targets → Your app name → and then the 'Build Phases' tab.
Expand 'Link Binary With Libraries', Click the + button in the bottom left of the 'Link Binary With Libraries' section and add the following libraries:
```
AudioToolbox.framework
CFNetwork.framework
CoreGraphics.framework
CoreLocation.framework
libz.dylib
MobileCoreServices.framework
QuartzCore.framework
Security.framework
StoreKit.framework
SystemConfiguration.framework
```
*4*. Create a Bridging Header (e.g. "UserManDemo/UserManDemo-Bridging-Header.h"), add the following line in:
```
#import <Parse/Parse.h>
```

*5*. Add the Bridging Header to project setting:
Click on Targets → Your app name → and then the 'Build Settings' tab.
Expand 'Swift Compiler - Code Generation', Set 'Objective-C Bridging Header' to the Bridging Header file name

*6*. Add Parse Application ID and Client Key in your app:
You can get the Parse Application ID and Client Key from "https://www.parse.com/apps" -> Select Your App in Parse -> Settings -> Application keys
Then paste the following inside the application:didFinishLaunchingWithOptions: function:
```
[Parse setApplicationId:@"XJzes5IHyIMXxXUsKN5GMypTLmM68dJPCAEadU55"
              clientKey:@"3N50GOgF8pJgMEa2LV7F6KWcM283Dp4FZasuqL1r"];
```

Open the workspace using Xcode 6 Beta 5
```
*7*. And to track statistics around application opens, add the following below that:
```
[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
```
*8* Compile and RUN.

### References:
1. https://www.parse.com/apps/quickstart?app_id=noapp--8#parse_data/mobile/ios/native/existing
2. https://medium.com/@kirualex/cocoapods-with-swift-e6f8ba8f0afc - How to create Bridging Header
