#import "record_audio_testAppDelegate.h"
#import "record_audio_testViewController.h"

@implementation record_audio_testAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
	
	
   // mviewController = [[record_audio_testViewController alloc] initWithNibName:@"record_audio_testViewController" bundle:[NSBundle mainBundle]];
    //[window addSubview:mviewController.view];
	
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
