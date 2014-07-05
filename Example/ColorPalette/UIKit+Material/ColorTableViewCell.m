//
//  ColorTableViewCell.m
//  UIKit+Material
//
//  Created by Tom Li on 6/7/14.
//  Copyright (c) 2014 Tom Li. All rights reserved.
//

#import "ColorTableViewCell.h"

@implementation ColorTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIColor *)textColorForBackgroundColor:(UIColor *)backgroundColor
{
    CGFloat hue, saturation, brightness, alpha;
    [backgroundColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    if (brightness > 0.75) {
        return [UIColor colorWithWhite:0.0f alpha:0.87f];
    } else {
        return [UIColor whiteColor];
    }
}

@end

NSString * const ColorTableViewCellIdentifier = @"ColorTableViewCellIdentifier";