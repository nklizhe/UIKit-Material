//
//  UIView+Material.h
//  Pods
//
//  Created by Tom Li on 6/7/14.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Material)

/**
 http://www.google.com/design/spec/layout/layout-principles.html#layout-principles-dimensionality
 */
- (void)setShadowDepth:(int)depth;
- (int)shadowDepth;

@end
