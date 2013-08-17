#import <UIKit/UIKit.h>

@protocol InfoViewControllerDelegate;


@interface InfoViewController : UIViewController {
	id <InfoViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <InfoViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end


@protocol InfoViewControllerDelegate
- (void)InfoViewControllerDidFinish:(InfoViewController *)controller;
@end

