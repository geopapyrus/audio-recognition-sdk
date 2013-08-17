#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AudioToolbox/AudioToolbox.h>




#import "InfoViewController.h"

extern int time_s;


@protocol record_audio_testViewControllerDelegate;


@interface record_audio_testViewController : UIViewController <AVAudioRecorderDelegate,UIPickerViewDelegate, UIPickerViewDataSource> {

	id <record_audio_testViewControllerDelegate> delegate;

//UIPickerViewDelegate, UIPickerViewDataSource> {

	int tmps;
    IBOutlet UILabel *mlabel;
    NSMutableArray *arrayNo;
    IBOutlet UIPickerView *pickerView;
	
	NSTimer* timer;
	
	UILabel *myLabel;
	UILabel *myLabel2;
	UILabel *myLabel3;
	
	IBOutlet UIButton * btnStart;
	IBOutlet UIButton * btnPlay;
	IBOutlet UIActivityIndicatorView * actSpinner;
	BOOL toggle;
	
	//Variables setup for access in the class:
	NSURL * recordedTmpFile;
	AVAudioRecorder * recorder;
	NSError * error;
	
}

//@property (nonatomic, retain) UILabel *mlabel;

@property (nonatomic, retain) UILabel *mlabel;

@property (nonatomic, retain) IBOutlet UILabel *myLabel;
@property (nonatomic, retain) IBOutlet UILabel *myLabel2;
@property (nonatomic, retain) IBOutlet UILabel *myLabel3;

@property (nonatomic,retain)IBOutlet UIActivityIndicatorView * actSpinner;
@property (nonatomic,retain)IBOutlet UIButton * btnStart;
@property (nonatomic,retain)IBOutlet UIButton * btnPlay;

- (IBAction) start_button_pressed;
- (IBAction) play_button_pressed;


- (IBAction)showInfo3:(id)sender;




@property (nonatomic, assign) id <record_audio_testViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end


@protocol record_audio_testViewControllerDelegate
- (void)record_audio_testViewControllerDidFinish:(record_audio_testViewController *)controller;
@end



@end