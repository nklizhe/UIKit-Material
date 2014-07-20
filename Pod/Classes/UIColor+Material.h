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

/**
 Return the predined color palette of material design.
 */
+ (NSDictionary *)colorPalette;

/**
 Return the list of color groups.
 */
+ (NSArray *)colorGroups;

/**
 Return all primary colors.
 */
+ (NSArray *)primaryColors;

/**
 Create and return a new color from a hex value (24-bit integer).
 */
+ (instancetype)colorWithHex:(NSUInteger)hex;

/**
 Create and return a new color from a hex value (24-bit integer) and alpha.
 */
+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;

/**
 Create and return a new color from a hex string, for example "#FF0000".
 */
+ (instancetype)colorWithHexString:(NSString *)hexString;

/**
 Create and return a new color from a hex string and alpha.
 */
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 Return the color for the specified name. The list of color names can be found at: 
 http://www.google.com/design/spec/style/color.html#
 */
+ (instancetype)colorWithName:(NSString *)name;

/**
 Return the color for the specified name and alpha.
 */
+ (instancetype)colorWithName:(NSString *)name alpha:(CGFloat)alpha;

/**
 Return the primary color of the specified color group.
 Possible color groups are:
 
 - Red
 - Pink
 - Purple
 - Deep Purple
 - Indigo
 - Blue
 - Light Blue
 - Cyan
 - Teal
 - Green
 - Light Green
 - Lime
 - Yellow
 - Amber
 - Orange
 - Deep Orange
 - Brown
 - Grey
 - Blue Grey
*/
+ (instancetype)primaryColorForGroup:(NSString *)group alpha:(CGFloat)alpha;

/**
 Returns the accent color of the specified color group and shade. Return nil if the color is not found.
 Possible shade values for accent colors are: 100, 200, 400, 700. 
 
 @note: some color groups may not have accent color defined.
 */
+ (NSString *)accentColorNameForGroup:(NSString *)group andShade:(int)shade;

/**
 Construct the color name with the color group name and shade.
 */
+ (NSString *)colorNameForGroup:(NSString *)group andShade:(int)shade;


@end
