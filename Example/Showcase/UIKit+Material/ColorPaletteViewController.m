//
//  ColorPaletteViewController.m
//  UIKit+Material
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import "ColorPaletteViewController.h"
#import "ColorTableViewCell.h"
#import <UIKit+Material/UIColor+Material.h>

@interface ColorPaletteViewController ()

@property (strong, nonatomic) NSArray *colorNames;
@property (strong, nonatomic) NSArray *colors;

@end

@implementation ColorPaletteViewController

- (instancetype)initWithColorGroup:(NSString *)colorGroup
{
    self = [super init];
    if (self) {
        self.colorGroup = colorGroup;
        
        NSArray *names = @[
                         [UIColor colorNameForGroup:self.colorGroup andShade:50],
                         [UIColor colorNameForGroup:self.colorGroup andShade:100],
                         [UIColor colorNameForGroup:self.colorGroup andShade:200],
                         [UIColor colorNameForGroup:self.colorGroup andShade:300],
                         [UIColor colorNameForGroup:self.colorGroup andShade:400],
                         [UIColor colorNameForGroup:self.colorGroup andShade:500],
                         [UIColor colorNameForGroup:self.colorGroup andShade:600],
                         [UIColor colorNameForGroup:self.colorGroup andShade:700],
                         [UIColor colorNameForGroup:self.colorGroup andShade:800],
                         [UIColor colorNameForGroup:self.colorGroup andShade:900],
                         [UIColor accentColorNameForGroup:self.colorGroup andShade:100],
                         [UIColor accentColorNameForGroup:self.colorGroup andShade:200],
                         [UIColor accentColorNameForGroup:self.colorGroup andShade:400],
                         [UIColor accentColorNameForGroup:self.colorGroup andShade:700]
                         ];

        NSMutableArray *colorNames = [[NSMutableArray alloc] init];
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        for (NSString *name in names) {
            UIColor *color = [UIColor colorWithName:name];
            if (color) {
                [colors addObject:color];
                [colorNames addObject:name];
            }
        }
        self.colorNames = colorNames;
        self.colors = colors;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.tableView];
    }
    [self.navigationItem setTitle:self.colorGroup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colorNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ColorTableViewCellIdentifier];
    if (!cell) {
        cell = [[ColorTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ColorTableViewCellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    UIColor *color = [self.colors objectAtIndex:indexPath.row];
    [cell setBackgroundColor:color];
    [cell.textLabel setText:[self.colorNames objectAtIndex:indexPath.row]];
    [cell.textLabel setTextColor:[cell textColorForBackgroundColor:color]];
    [cell.detailTextLabel setText:[[UIColor colorPalette] objectForKey:[self.colorNames objectAtIndex:indexPath.row]]];
    [cell.detailTextLabel setTextColor:[cell textColorForBackgroundColor:color]];
    
    return cell;
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
