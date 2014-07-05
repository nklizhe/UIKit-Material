//
//  UIFont+Material.h
//  Pods
//
//  Created by Tom Li on 6/7/14.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    MDTextStyleDisplay4,
    MDTextStyleDisplay3,
    MDTextStyleDisplay2,
    MDTextStyleDisplay1,
    MDTextStyleHeadline,
    MDTextStyleTitle,
    MDTextStyleSubhead,
    MDTextStyleBody2,
    MDTextStyleBody1,
    MDTextStyleCaption,
    MDTextStyleMenu,
    MDTextStyleButton
} MaterialDesignTextStyle;

@interface UIFont (Material)

+ (instancetype)robotoFontWithName:(NSString *)fontName size:(CGFloat)size;
+ (instancetype)robotoFontOfSize:(CGFloat)size;
+ (instancetype)robotoThinFontOfSize:(CGFloat)size;
+ (instancetype)robotoBoldFontOfSize:(CGFloat)size;
+ (instancetype)robotoBoldItalicFontOfSize:(CGFloat)size;
+ (instancetype)robotoCondensedFontOfSize:(CGFloat)size;
+ (instancetype)robotoLightItalicFontOfSize:(CGFloat)size;
+ (instancetype)robotoMediumItalicFontOfSize:(CGFloat)size;
+ (instancetype)robotoBlackFontOfSize:(CGFloat)size;
+ (instancetype)robotoMediumFontOfSize:(CGFloat)size;
+ (instancetype)robotoCondensedLightFontOfSize:(CGFloat)size;

/**
 Available styles:
    Display 4
    Display 3
    Display 2
    Display 1
    Headline
    Title
    Subhead
    Body 2
    Body 1
    Caption
    Menu
    Button
 */
+ (instancetype)preferredFontForStyle:(MaterialDesignTextStyle)style;

@end
