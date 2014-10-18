//
//  SimpleTableCellTableViewCell.m
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 18/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import "SimpleTableCell.h"

#import "ViewController.h"


@implementation SimpleTableCell

@synthesize nameLabel = _nameLabel;
@synthesize thumbnailImageView = _thumbnailImageView;




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)shared:(id)sender {
    NSString *tempString = [NSString stringWithFormat:@"%@",_nameLabel];
    
    
   /* if( [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        _slComposeViewControler = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [_slComposeViewControler addImage:[UIImage imageWithData:UIImageJPEGRepresentation(_thumbnailImageView.image, 1.0)]];
        [_slComposeViewControler setInitialText:tempString];
        [ self presentViewController:_slComposeViewControler animated:YES completion:NULL];
    }else{
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"No Account Found" message:@"Configure account fb in setings" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil,nil ];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
    }*/
    
}

@end
