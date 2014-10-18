//
//  View2.m
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 16/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import "View2.h"


NSString *array[3] = {@"Volaris",@"AeroMexico",@"Interject"};
//Estados de origen para cada aerolinea
NSString *estados[3] = {@"Jalisco",@"Michoacan",@"Veracruz"};
NSString *estadosA[3] = {@"BajaCalifornia",@"Chihuahua",@"San Luis Potosi" };
NSString *estadosI[3] = {@"Chiapas" ,@"Guanajuato" ,@"Aguascalientes"};
//Estados destino para cada aerolinea
NSString *destinos[3] = {@"Michoacan",@"Tamapulipas",@"Tampico" };


@interface View2 ()

@end

@implementation View2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//DATASOURCE METHODS
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ( component == 0 ){
        return 3;
    }
    if ( component == 1 ){
        return 3;
    }
    if ( component == 2 ){
        return 3;
    }
    return 0;
}

//DELEGATE METHODS
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if ( component == 0 ){
        return array[row];
    }
    if ( component == 1 ){
        return estados[row];
    }
    if ( component == 2 ){
        return destinos[row];
    }
    return array[row];
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

- (IBAction)buttonPressed:(id)sender {
    NSString *select = array[[_picker selectedRowInComponent:0]];
    //NSString *title = [[NSString alloc] initWithFormat:@"Seleccionaste %@",select];
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"YEEEI" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //[alert show];
    _aerolinea.text = select;
    _origen.text = estados[[_picker selectedRowInComponent:1]];
    _destino.text = destinos[[_picker selectedRowInComponent:2]];
    
}

- (IBAction)shareToFacebook:(id)sender {
    
    NSString *temp1 = @" Aerolinea: ";
    NSString *tempAerolinea = [ temp1 stringByAppendingString:_aerolinea.text];
    
    NSString *temp2 = @" Origen: ";
    NSString *tempOrigen = [ temp2 stringByAppendingString:_origen.text];
    
    NSString *temp3 = @" Destino: ";
    NSString *tempDest = [ temp3 stringByAppendingString:_destino.text];
    
    NSString *tempString = [tempAerolinea stringByAppendingString:tempOrigen];
    NSString *tempString2 = [tempString stringByAppendingString:tempDest];
    
    if( [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        self.slComposeViewControler = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [_slComposeViewControler setInitialText:tempString2];
        [self presentViewController:_slComposeViewControler animated:YES completion:NULL];
    }else{
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"No Account Found" message:@"Configure account fb in setings" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil,nil ];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
    }
}
@end
