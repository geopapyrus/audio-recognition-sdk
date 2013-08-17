#import "record_audio_testViewController.h"
#include "audio_sdk.h";

int time_s;
@implementation record_audio_testViewController
@synthesize actSpinner, btnStart, btnPlay, myLabel, myLabel2, myLabel3, mlabel, delegate;



- (void)viewDidLoad {
    [super viewDidLoad];
	
	
    arrayNo = [[NSMutableArray alloc] init];
	
    [arrayNo addObject:@"5"];
    [arrayNo addObject:@"10"];
    [arrayNo addObject:@"15"];
    [arrayNo addObject:@"20"];
    [arrayNo addObject:@"30"];
    tmps=15;
    [pickerView selectRow:2 inComponent:0 animated:NO];
    mlabel.text= [arrayNo objectAtIndex:[pickerView selectedRowInComponent:0]];  
	
	//Start the toggle in true mode.
	toggle = YES;
	btnPlay.hidden = YES;

	

	AVAudioSession * audioSession = [AVAudioSession sharedInstance];
	[audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: &error];
	UInt32 doChangeDefaultRoute = 1;
	AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof(doChangeDefaultRoute), &doChangeDefaultRoute);
	[audioSession setActive:YES error: &error];
	
}


- (IBAction)  start_button_pressed{

	if(toggle)
	{
		time_s=0;
		toggle = NO;
		[actSpinner startAnimating];

		btnStart.enabled = toggle;
		btnStart.hidden = !toggle;

		
		
		NSString * theValue4 = [NSString stringWithFormat:@""];
		
		[myLabel2 setText:theValue4];

		NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] init];
		[recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
		[recordSetting setValue:[NSNumber numberWithFloat:11025.0] forKey:AVSampleRateKey]; 
		[recordSetting setValue:[NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
		[recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey]; 
		[recordSetting setValue:[NSNumber numberWithBool: NO] forKey:AVLinearPCMIsBigEndianKey];
	
		recordedTmpFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent: [NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"wav"]]];
		NSLog(@"Using File called: %@",recordedTmpFile);
		recorder = [[ AVAudioRecorder alloc] initWithURL:recordedTmpFile settings:recordSetting error:&error];
		[recorder setDelegate:self];
		[recorder prepareToRecord];
		[recorder record];

		
		
		time_s++;

		
		timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moveRect) userInfo:nil repeats:YES];
		
		
	}
	else
	{
		
		[timer invalidate];	

		toggle = YES;
		[actSpinner stopAnimating];

		btnStart.enabled = toggle;
		btnStart.hidden = !toggle;
		
		NSLog(@"Using File called: %@",recordedTmpFile);

		[recorder stop];
	}
}





-(void)moveRect
{

	int limit=tmps;

	
  if(time_s!=-1)
  {
	  if(time_s==limit) {
		  
		  NSString *theValue = [NSString stringWithFormat:@"Analyzing..."];
		  [myLabel setText:theValue];
		  time_s++;
	  }
	else if(time_s>limit) 
	{
		
		
		
		[timer invalidate];	
		
		
		
		toggle = YES;

		btnStart.enabled = toggle;
		btnStart.hidden = !toggle;
		
		NSLog(@"Using File called: %@",recordedTmpFile);

		[recorder stop];
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
				
		
		NSString *urlString = [recordedTmpFile path];

		
		search_result rrr;
		
		
		
		int rsi=wavtest2(test1,test2,&rrr,(char*)[urlString cStringUsingEncoding:1]);
						 
						 

		NSString * theValue2 = [NSString stringWithFormat:@"%s",rrr.name];
		
	

		
		[actSpinner stopAnimating];
		
		[myLabel setText:theValue2];
		
		
		if(rrr.start1!=-1)
		{
		
		NSString * theValue3 = [NSString stringWithFormat:@"entre %d e %d segundos",(int)round(rrr.start1/100.0),(int)round(rrr.end1/100.0)];
			
			[myLabel2 setText:theValue3];
		}

		
		time_s=-1;
	}
	else {
		NSString *theValue = [NSString stringWithFormat:@"Listening... %d",time_s];
		[myLabel setText:theValue];
		time_s++;

	}
	
  }
}




- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    mlabel.text=    [arrayNo objectAtIndex:row];
	tmps=[[arrayNo objectAtIndex:row] intValue];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [arrayNo count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrayNo objectAtIndex:row];
}

 
 

-(IBAction) play_button_pressed{

}





































- (void)InfoViewControllerDidFinish:(InfoViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}



- (IBAction)showInfo3:(id)sender {    
	
	InfoViewController *controller = [[InfoViewController alloc] initWithNibName:@"InfoView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}















- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	//Clean up the temp file.
	NSFileManager * fm = [NSFileManager defaultManager];
	[fm removeItemAtPath:[recordedTmpFile path] error:&error];
	//Call the dealloc on the remaining objects.
	[recorder dealloc];
	recorder = nil;
	recordedTmpFile = nil;
}


- (void)dealloc {
	[super dealloc];
}



- (IBAction)done:(id)sender {
	[self.delegate record_audio_testViewControllerDidFinish:self];	
}


@end
