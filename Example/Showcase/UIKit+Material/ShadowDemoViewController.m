//
//  ShadowDemoViewController.m
//  Showcase
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import "ShadowDemoViewController.h"
#import <UIKit+Material/UIView+Material.h>

#define kNumBoxes  5
#define kBoxWidth  200.0f
#define kBoxHeight 200.0f

@interface ShadowDemoViewController ()

@property (strong, nonatomic) NSArray *boxes;

@end


@implementation ShadowDemoViewController

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
    
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    for (int i=0; i<kNumBoxes; i++) {
        UIView *box = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.contentView.bounds) - kBoxWidth / 2.0f,
                                                               i * (30.0 + kBoxHeight),
                                                               kBoxWidth,
                                                               kBoxHeight)];
        [box setShadowDepth:i+1];
        [box setBackgroundColor:[UIColor whiteColor]];
        
        [self.contentView addSubview:box];
        [self.contentView setContentSize:CGSizeMake(CGRectGetWidth(self.contentView.bounds), CGRectGetMaxY(box.frame) + 30.0)];
        [tmp addObject:box];
    }
    self.boxes = tmp;
    
    [self.contentView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.12]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
