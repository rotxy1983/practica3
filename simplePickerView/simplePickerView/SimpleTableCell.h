//
//  SimpleTableCellTableViewCell.h
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 18/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface SimpleTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong,nonatomic) SLComposeViewController *slComposeViewControler;
@property (strong,nonatomic) NSData *imageToShare;


- (IBAction)shared:(id)sender;

@end
