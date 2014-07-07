//
//  INViewController.m
//  UIKit+Material
//
//  Created by Tom Li on 07/05/2014.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import "ColorGroupsViewController.h"
#import "ColorTableViewCell.h"
#import "ColorPaletteViewController.h"
#import <UIKit+Material/UIColor+Material.h>

@interface ColorGroupsViewController ()

@end

@implementation ColorGroupsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[UIColor colorGroups] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ColorTableViewCellIdentifier];
    if (!cell) {
        cell = [[ColorTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ColorTableViewCellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    NSString *colorGroup = [[UIColor colorGroups] objectAtIndex:indexPath.row];
    NSString *colorName = [UIColor colorNameForGroup:colorGroup andShade:500];
    UIColor *color = [UIColor primaryColorForGroup:colorGroup alpha:1.0f];
    [cell setBackgroundColor:color];
    [cell.textLabel setText:colorGroup];
    [cell.textLabel setTextColor:[cell textColorForBackgroundColor:color]];
    [cell.detailTextLabel setText:[[UIColor colorPalette] objectForKey:colorName]];
    [cell.detailTextLabel setTextColor:[cell textColorForBackgroundColor:color]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *colorGroup = [[UIColor colorGroups] objectAtIndex:indexPath.row];
    ColorPaletteViewController *paletteVC = [[ColorPaletteViewController alloc] initWithColorGroup:colorGroup];
    [self.navigationController pushViewController:paletteVC animated:YES];
}
@end
