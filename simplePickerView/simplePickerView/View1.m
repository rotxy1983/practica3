//
//  View1.m
//  simplePickerView
//
//  Created by Maria del Rosario Plascencia Villegas on 16/10/14.
//  Copyright (c) 2014 Rosario Plascencia. All rights reserved.
//

#import "View1.h"
#import "SimpleTableCell.h"

@interface View1 ()

@end

@implementation View1
@synthesize imageToShare;

NSArray *tableData;
NSArray *thumbnails;
NSString *nombre;

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
    tableData = [NSArray arrayWithObjects:@"Angel", @"Josue", @"Dania", @"Paloma", @"Ian", @"Fernado", nil];
    
    // Initialize thumbnails
    thumbnails = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"green_tea.jpg", @"mushroom_risotto.jpg",  @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"white_chocolate_donut.jpg", nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return 4;
    else
        return 1;
    
}

-(NSString *)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0)
        return  @"Contactos";
    else
        return @"Acciones";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    //if (cell == nil){
      //  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    //}
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }//cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    
    
    if (indexPath.section == 0) {
        
        cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
        cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
        imageToShare = UIImageJPEGRepresentation(cell.thumbnailImageView.image, 1.0);
        nombre = cell.nameLabel.text;
        // cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
       // cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    }else{
        cell.textLabel.text = @"Share them all to Facebook";
    }
    
    
    return cell;
}



@end




