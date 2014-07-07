//
//  UIView+Material.m
//  Pods
//
//  Created by Tom Li on 6/7/14.
//
//

#import "UIView+Material.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation UIView (Material)

- (void)setShadowDepth:(int)depth
{
    if (depth < 0) depth = 0;
    if (depth > 5) depth = 5;
    
    switch (depth) {
        case 0:
            // no shadow
            [self.layer setShadowOpacity:0.0];
            [self.layer setMasksToBounds:YES];
            break;
        case 1:
            [self.layer setMasksToBounds:NO];
            [self.layer setShadowColor:[[UIColor colorWithWhite:0.0 alpha:0.24] CGColor]];
            [self.layer setShadowOffset:CGSizeMake(0, 1)];
            [self.layer setShadowRadius:1.5];
            [self.layer setShadowOpacity:1.0];
            break;
        case 2:
            [self.layer setMasksToBounds:NO];
            [self.layer setShadowColor:[[UIColor colorWithWhite:0.0 alpha:0.23] CGColor]];
            [self.layer setShadowOffset:CGSizeMake(0, 3)];
            [self.layer setShadowRadius:3.0];
            [self.layer setShadowOpacity:1.0];
            break;
        case 3:
            [self.layer setMasksToBounds:NO];
            [self.layer setShadowColor:[[UIColor colorWithWhite:0.0 alpha:0.23] CGColor]];
            [self.layer setShadowOffset:CGSizeMake(0, 6)];
            [self.layer setShadowRadius:3.0];
            [self.layer setShadowOpacity:1.0];
            break;
        case 4:
            [self.layer setMasksToBounds:NO];
            [self.layer setShadowColor:[[UIColor colorWithWhite:0.0 alpha:0.22] CGColor]];
            [self.layer setShadowOffset:CGSizeMake(0, 10)];
            [self.layer setShadowRadius:5.0];
            [self.layer setShadowOpacity:1.0];
            break;
        case 5:
            [self.layer setMasksToBounds:NO];
            [self.layer setShadowColor:[[UIColor colorWithWhite:0.0 alpha:0.22] CGColor]];
            [self.layer setShadowOffset:CGSizeMake(0, 15)];
            [self.layer setShadowRadius:6.0];
            [self.layer setShadowOpacity:1.0];
            break;
        default:
            break;
    }
    objc_setAssociatedObject(self, "_shadowDepth", @(depth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)shadowDepth
{
    return [(NSNumber *)objc_getAssociatedObject(self, "_shadowDepth") intValue];
}

@end
