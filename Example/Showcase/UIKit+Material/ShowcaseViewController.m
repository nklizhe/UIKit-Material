//
//  ShowcaseViewController.m
//  Showcase
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import "ShowcaseViewController.h"
#import <UIKit+Material/UIFont+Material.h>
#import <UIKit+Material/UIColor+Material.h>
#import "ColorGroupsViewController.h"
#import "ShadowDemoViewController.h"
@interface ShowcaseViewController ()

@property (strong, nonatomic) NSArray *showcases;

@end

@implementation ShowcaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    self.showcases = @[ @"Colors", @"Shadows" ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.showcases count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShowcaseTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ShowcaseTableViewCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    UIColor *textColor = [UIColor colorWithWhite:0.0 alpha:0.87];
    
    [cell.textLabel setText:[self.showcases objectAtIndex:indexPath.row]];
    [cell.textLabel setTextColor:textColor];
    [cell.textLabel setFont:[UIFont preferredFontForStyle:MDTextStyleSubhead]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.showcases objectAtIndex:indexPath.row] isEqualToString:@"Colors"]) {
        ColorGroupsViewController *controller = (ColorGroupsViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ColorDemoViewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if ([[self.showcases objectAtIndex:indexPath.row] isEqualToString:@"Shadows"]) {
        ShadowDemoViewController *controller = (ShadowDemoViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ShadowDemoViewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }
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
