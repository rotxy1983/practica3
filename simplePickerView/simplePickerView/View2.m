//
//  View2.m
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 16/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import "View2.h"


NSString *array[3] = {@"Volaris",@"AeroMexico",@"Interject"};
NSString *estados[3] = {@"Jalisco",@"Michoacan",@"Veracruz"};//,@"BajaCalifornia",@"Chihuahua",@"San Luis Potosi",@"Chiapas" ,@"Guanajuato" ,@"Aguascalientes"};
NSString *ciudades[3] = {@"BajaCalifornia",@"Chihuahua",@"San Luis Potosi" };//@"cd1",@"cd2",@"cd3"@"cd4",@"cd5",@"cd6",@"cd8",@"cd9",@"cd10"@"cd11",@"cd12",@"cd13",
//@"cd14",@"cd15",@"cd16"@"cd17",@"cd18",@"cd19",@"cd20",@"cd21",@"cd22"@"cd23",@"cd24",@"cd25",@"cd26",@"cd27"};

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
        return ciudades[row];
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
    NSString *title = [[NSString alloc] initWithFormat:@"Seleccionaste %@",select];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"YEEEI" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    _aerolinea.text = select;
    _origen.text = estados[[_picker selectedRowInComponent:1]];
    _destino.text = ciudades[[_picker selectedRowInComponent:2]];
    
}
@end
