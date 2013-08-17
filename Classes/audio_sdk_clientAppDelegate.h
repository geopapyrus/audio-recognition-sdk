#import <UIKit/UIKit.h>

@class audio_sdk_clientViewController;

@interface audio_sdk_clientAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    audio_sdk_clientViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet audio_sdk_clientViewController *viewController;

@end

