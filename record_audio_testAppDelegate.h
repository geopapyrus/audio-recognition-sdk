#import <UIKit/UIKit.h>

@class record_audio_testViewController;

@interface record_audio_testAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    record_audio_testViewController *viewController;
    record_audio_testViewController *mviewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet record_audio_testViewController *viewController;
@property (nonatomic, retain) IBOutlet record_audio_testViewController *mController;

@end

