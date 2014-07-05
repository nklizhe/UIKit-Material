//
//  UIFont+Material.m
//  Pods
//
//  Created by Tom Li on 6/7/14.
//
//

#import "UIFont+Material.h"
#import <CoreText/CoreText.h>

// Load font from bundle
// https://github.com/kylef/OpenSans-pod/blob/master/UIFont%2BOpenSans.m
static void LoadRobotoFontWithFileName(NSString *fontFileName) {
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"Roboto" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    NSURL *fontURL = [bundle URLForResource:fontFileName withExtension:@"ttf"];
    NSData *fontData = [NSData dataWithContentsOfURL:fontURL];
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
    CGFontRef font = CGFontCreateWithDataProvider(provider);
    
    if (font) {
        CFErrorRef error = NULL;
        if (CTFontManagerRegisterGraphicsFont(font, &error) == NO) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:(__bridge NSString *)errorDescription userInfo:@{ NSUnderlyingErrorKey: (__bridge NSError *)error }];
        }
        
        CFRelease(font);
    }
    
    CFRelease(provider);
}

@implementation UIFont (Material)

+ (instancetype)robotoFontWithName:(NSString *)fontName size:(CGFloat)size
{
    static NSDictionary *_fontFiles = nil;
    static NSMutableDictionary *_fontLoaded = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _fontFiles =
        @{
          @"Roboto-Black": @"Roboto-Black",
          @"Roboto-Bold": @"Roboto-Bold",
          @"Roboto-BlackItalic": @"Roboto-BlackItalic",
          @"Roboto-BoldItalic": @"Roboto-BoldItalic",
          @"Roboto-Italic": @"Roboto-Italic",
          @"Roboto-Light": @"Roboto-Light",
          @"Roboto-LightItalic": @"Roboto-LightItalic",
          @"Roboto-Medium": @"Roboto-Medium",
          @"Roboto-MediumItalic": @"Roboto-MediumItalic",
          @"Roboto-Regular": @"Roboto-Regular",
          @"Roboto-Thin": @"Roboto-Thin",
          @"Roboto-ThinItalic": @"Roboto-ThinItalic",
          @"RobotoCondensed-Bold": @"RobotoCondensed-Bold",
          @"RobotoCondensed-BoldItalic": @"RobotoCondensed-BoldItalic",
          @"RobotoCondensed-Italic": @"RobotoCondensed-Italic",
          @"RobotoCondensed-Light": @"RobotoCondensed-Light",
          @"RobotoCondensed-LightItalic": @"RobotoCondensed-LightItalic",
          @"RobotoCondensed-Regular": @"RobotoCondensed-Regular"
          };
        _fontLoaded = [[NSMutableDictionary alloc] init];
    });
    
    BOOL loaded = [[_fontLoaded objectForKey:fontName] boolValue];
    if (!loaded) {
        NSString *fontFileName = [_fontFiles objectForKey:fontName];
        if (fontFileName) {
            LoadRobotoFontWithFileName(fontFileName);
            [_fontLoaded setObject:@(YES) forKey:fontName];
        }
    }
    UIFont *font = [self fontWithName:fontName size:size];
    if (!font) {
        NSLog(@"WARN: missing font for name: %@", fontName);
        font = [self systemFontOfSize:size];
    }
    return font;
}

+ (instancetype)robotoFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-Regular" size:size];
}

+ (instancetype)robotoThinFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-Thin" size:size];
}

+ (instancetype)robotoBoldFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-Bold" size:size];
}

+ (instancetype)robotoBoldItalicFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-BoldItalic" size:size];
}

+ (instancetype)robotoCondensedFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"RobotoCondensed-Regular" size:size];
}

+ (instancetype)robotoLightItalicFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-LightItalic" size:size];
}

+ (instancetype)robotoMediumItalicFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-MediumItalic" size:size];
}

+ (instancetype)robotoBlackFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-Black" size:size];
}

+ (instancetype)robotoMediumFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"Roboto-Medium" size:size];
}

+ (instancetype)robotoCondensedLightFontOfSize:(CGFloat)size
{
    return [self robotoFontWithName:@"RobotoCondensed-Light" size:size];
}

+ (instancetype)preferredFontForStyle:(MaterialDesignTextStyle)style
{
    switch (style) {
        case MDTextStyleDisplay4:
            return [self robotoFontWithName:@"Roboto-Light" size:112.0];
            break;
        case MDTextStyleDisplay3:
            return [self robotoFontOfSize:56.0];
            break;
        case MDTextStyleDisplay2:
            return [self robotoFontOfSize:45.0];
            break;
        case MDTextStyleDisplay1:
            return [self robotoFontOfSize:34.0];
            break;
        case MDTextStyleHeadline:
            return [self robotoFontOfSize:24.0];
            break;
        case MDTextStyleTitle:
            return [self robotoMediumFontOfSize:20.0];
            break;
        case MDTextStyleSubhead:
            return [self robotoFontOfSize:16.0];
            break;
        case MDTextStyleBody2:
            return [self robotoMediumFontOfSize:14.0];
            break;
        case MDTextStyleBody1:
            return [self robotoFontOfSize:14.0];
            break;
        case MDTextStyleCaption:
            return [self robotoFontOfSize:12.0];
            break;
        case MDTextStyleMenu:
            return [self robotoMediumFontOfSize:14.0];
            break;
        case MDTextStyleButton:
            return [self robotoMediumFontOfSize:14.0];
            break;
        default:
            break;
    }
    NSLog(@"Unknown font style: %d", style);
    return [self systemFontOfSize:14.0];
}

@end
