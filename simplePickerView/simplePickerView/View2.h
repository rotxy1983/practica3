//
//  View2.h
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 16/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface View2 : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *aerolinea;
@property (weak, nonatomic) IBOutlet UITextField *origen;
@property (weak, nonatomic) IBOutlet UITextField *destino;
@property (strong,nonatomic) SLComposeViewController *slComposeViewControler;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)shareToFacebook:(id)sender;

@end
