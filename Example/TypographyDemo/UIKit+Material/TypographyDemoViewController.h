//
//  TypographyDemoViewController.h
//  TypographyDemo
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypographyDemoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) IBOutlet UITableView *tableView;

@end
