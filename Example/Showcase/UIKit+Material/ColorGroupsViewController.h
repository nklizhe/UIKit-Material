//
//  INViewController.h
//  UIKit+Material
//
//  Created by Tom Li on 07/05/2014.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorGroupsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) IBOutlet UITableView *tableView;

@end
