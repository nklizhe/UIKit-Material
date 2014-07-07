//
//  ShowcaseViewController.h
//  Showcase
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorGroupsViewController;

@interface ShowcaseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) IBOutlet UITableView *tableView;

@end
