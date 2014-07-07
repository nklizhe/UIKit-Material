//
//  ColorTableViewCell.h
//  UIKit+Material
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorTableViewCell : UITableViewCell

- (UIColor *)textColorForBackgroundColor:(UIColor *)backgroundColor;

@end

extern NSString * const ColorTableViewCellIdentifier;