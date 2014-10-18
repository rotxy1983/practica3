//
//  View3.m
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 16/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import "View3.h"

@interface View3 ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerBegin;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerEnds;
@property (weak, nonatomic) IBOutlet UITextField *diferencia;

@end

@implementation View3
- (IBAction)seeAction:(id)sender {
    NSDate *begin = _datePickerBegin.date;
    NSDate *ends = _datePickerEnds.date;
    
    //GET # OF DAYS
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"dd MM yyyy"];       //Remove the time part
    NSString *TodayString = [df stringFromDate:begin];
    NSString *TargetDateString = [df stringFromDate:ends];
    NSTimeInterval time = [[df dateFromString:TargetDateString] timeIntervalSinceDate:[df dateFromString:TodayString]];
    int days = time / 60 / 60/ 24;
    self.diferencia.text = @(days).stringValue;
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)shareToFB:(id)sender {
    NSString *temp1 = @" La diferencia entre fechas es: ";
    NSString *temp2 = [ temp1 stringByAppendingString:self.diferencia.text];
    NSString *tempMessage = [temp2 stringByAppendingString:@" dias"];
    
    if( [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        self.slComposeViewControler = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [_slComposeViewControler setInitialText:tempMessage];
        [self presentViewController:_slComposeViewControler animated:YES completion:NULL];
    }else{
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"No Account Found" message:@"Configure account fb in setings" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil,nil ];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.datePickerBegin addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
