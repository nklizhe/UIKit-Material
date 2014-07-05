//
//  UIColor+Material.h
//  Pods
//
//  Created by Tom Li on 6/7/14.
//
//

#import <UIKit/UIKit.h>

// http://www.google.com/design/spec/style/color.html#color-ui-color-palette
@interface UIColor (Material)

+ (NSDictionary *)colorPalette;
+ (NSArray *)colorGroups;
+ (NSArray *)primaryColors;

+ (instancetype)colorWithHex:(NSUInteger)hex;
+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;
+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (instancetype)colorWithName:(NSString *)name;
+ (instancetype)colorWithName:(NSString *)name alpha:(CGFloat)alpha;

// primary colors
+ (instancetype)primaryColorForGroup:(NSString *)group alpha:(CGFloat)alpha;

+ (NSString *)colorNameForGroup:(NSString *)group andShade:(int)shade;
+ (NSString *)accentColorNameForGroup:(NSString *)group andShade:(int)shade;


@end
