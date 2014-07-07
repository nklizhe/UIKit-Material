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

- (void)showRippleAnimationFromPosition:(CGPoint)position completion:(void (^)(BOOL finished))completion
{
    CALayer *animContainerLayer = objc_getAssociatedObject(self, "_rippleAnimLayer");
    if (!animContainerLayer) {
        animContainerLayer = [[CALayer alloc] init];
        [self.layer addSublayer:animContainerLayer];
        objc_setAssociatedObject(self, "_rippleAnimLayer", animContainerLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    animContainerLayer.frame = self.bounds;
    animContainerLayer.masksToBounds = YES;
    animContainerLayer.backgroundColor = [self.tintColor CGColor];
    animContainerLayer.opacity = 0.24f;

    CGFloat w = CGRectGetWidth(self.bounds), h = CGRectGetHeight(self.bounds);
    CGFloat radius = MAX(w, h) * 1.5f;// * 0.66f;
    CGRect frame = CGRectMake(position.x - radius/2.f, position.y - radius/2.f, radius, radius);

    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = CGPathCreateWithRoundedRect(CGRectMake(position.x, position.y, 0, 0), 0, 0, nil);
    maskLayer.backgroundColor = [[UIColor blackColor] CGColor];
    animContainerLayer.mask = maskLayer;
    
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"path"];
    [anim1 setToValue:CFBridgingRelease(CGPathCreateWithRoundedRect(frame, radius/2.f, radius/2.f, nil))];
    [anim1 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [anim3 setBeginTime:0.15f];
    [anim3 setToValue:@(0.0f)];
    [anim3 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];

    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:anim1, anim3, nil];
    group.duration = 0.4f;

    [maskLayer addAnimation:group forKey:@"_ripple"];
}

@end
