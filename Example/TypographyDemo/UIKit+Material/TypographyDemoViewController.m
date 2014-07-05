//
//  TypographyDemoViewController.m
//  TypographyDemo
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import "TypographyDemoViewController.h"
#import "TypographyDemoTableViewCell.h"
#import <UIKit+Material/UIFont+Material.h>

@interface TypographyDemoViewController ()

@property (strong, nonatomic) NSArray *demoTexts;

@end

@implementation TypographyDemoViewController

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
    
    self.demoTexts =
    @[
      @[ @"Quantum Mechanics", [UIFont robotoFontOfSize:48.f], @(64.f), @"REGULAR" ],
      @[ @"6.626069x10-34", [UIFont robotoThinFontOfSize:56.f], @(64.0), @"THIN" ],
      @[ @"One hundred percent cotton bond", [UIFont robotoBoldItalicFontOfSize:28.f], @(48.0), @"BOLD ITALIC" ],
      @[ @"Quasiparticles", [UIFont robotoBoldFontOfSize:64.f], @(64.0), @"BOLD" ],
      @[ @"It became the non-relativistic limit of quantum field theory", [UIFont robotoCondensedFontOfSize:18.f], @(36.0), @"CONDENSED" ],
      @[ @"PAPERCRAFT", [UIFont robotoLightItalicFontOfSize:72.f], @(80.0), @"LIGHT ITALIC" ],
      @[ @"Probabilistic wave - particle wavefunction orbital path", [UIFont robotoMediumItalicFontOfSize:18.f], @(36.0), @"MEDIUM ITALIC" ],
      @[ @"ENTANGLED", [UIFont robotoBlackFontOfSize:72.f], @(80.0), @"BLACK" ],
      @[ @"Cardstock 80lb ultra-bright orange", [UIFont robotoMediumFontOfSize:28.f], @(36.0), @"MEDIUM" ],
      @[ @"STATIONARY", [UIFont robotoThinFontOfSize:72.f], @(80.0), @"THIN" ],
      @[ @"POSITION, MOMENTUM & SPIN", [UIFont robotoCondensedLightFontOfSize:32.f], @(48.0), @"CONDENSED LIGHT" ]
      ];
    
    [self.navigationItem setTitle:@"Typography"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.demoTexts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TypographyDemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TypegraphyDemoTableViewCellIdentifier];
    if (!cell) {
        cell = [[TypographyDemoTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                                  reuseIdentifier:TypegraphyDemoTableViewCellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    NSArray *demo = [self.demoTexts objectAtIndex:indexPath.row];
    NSString *text = [demo objectAtIndex:0];
    UIFont *font = [demo objectAtIndex:1];
    NSString *fontName = [demo objectAtIndex:3];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell.textLabel setText:text];
    [cell.textLabel setFont:font];
    [cell.textLabel setTextColor:[UIColor colorWithWhite:0.0 alpha:0.87]];
    [cell.detailTextLabel setText:fontName];
    [cell.detailTextLabel setFont:[UIFont robotoFontOfSize:16.0]];
    [cell.detailTextLabel setTextColor:[UIColor colorWithWhite:0.0 alpha:0.54]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[[self.demoTexts objectAtIndex:indexPath.row] objectAtIndex:2] floatValue];
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
