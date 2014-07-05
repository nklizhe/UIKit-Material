//
//  UIColor+Material.m
//  Pods
//
//  Created by Tom Li on 6/7/14.
//
//

#import "UIColor+Material.h"

@implementation UIColor (Material)

+ (instancetype)colorWithHex:(NSUInteger)hex
{
    return [self colorWithHex:hex alpha:1.0f];
}

+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha
{
    CGFloat red, green, blue;
    
    red = ( hex >> 16 ) & 0xFF;
    green = ( hex >> 8 ) & 0xFF;
    blue = hex & 0xFF;
    
    UIColor *color = [UIColor colorWithRed: red / 255.0f green: green / 255.0f blue: blue / 255.0f alpha: alpha];
    
    return color;
}

+ (instancetype)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString alpha:1.0f];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    NSParameterAssert(hexString);
    
    // convert Objective-C NSString to C string
    const char *cstr = [hexString cStringUsingEncoding: NSASCIIStringEncoding];
    unsigned long hex;

    // trim leading '#' and spaces
    while ( cstr[0] == '#' || cstr[0] == ' ' || cstr[0] == '\t' ) {
        cstr++;
    }
    
    // only handle first 6 characters
    if ( strlen(cstr) > 6 ) {
        cstr = strndup(cstr, 6);
        hex = strtol(cstr, NULL, 16);
        free((void *)cstr);
    } else {
        hex = strtol(cstr, NULL, 16);
    }
    
    UIColor *color = [self colorWithHex:hex alpha:alpha];
    return color;
}

+ (instancetype)colorWithName:(NSString *)name
{
    return [self colorWithName:name alpha:1.0f];
}

+ (instancetype)colorWithName:(NSString *)name alpha:(CGFloat)alpha
{
    NSParameterAssert(name);
    NSString *hexString = [self.colorPalette objectForKey:name];
    if (hexString) {
        return [self colorWithHexString:hexString alpha:alpha];
    } else {
        return nil;
    }
}

+ (NSString *)colorNameForGroup:(NSString *)group andShade:(int)shade
{
    return [NSString stringWithFormat:@"%@ %d", [group capitalizedString], shade];
}

+ (NSString *)accentColorNameForGroup:(NSString *)group andShade:(int)shade
{
    return [NSString stringWithFormat:@"%@ A%d", [group capitalizedString], shade];
}

+ (instancetype)primaryColorForGroup:(NSString *)group alpha:(CGFloat)alpha
{
    NSString *colorName = [self colorNameForGroup:group andShade:500];
    return [self colorWithName:colorName alpha:alpha];
}

+ (NSArray *)primaryColors
{
    static NSArray *_primaryColors = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        for (NSString *group in [self colorGroups]) {
            [colors addObject:[self primaryColorForGroup:group alpha:1.f]];
        }
        _primaryColors = colors;
    });
    return _primaryColors;
}

+ (NSArray *)colorGroups
{
    static NSArray *_colorGroups = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _colorGroups = @[
                         @"Red",
                         @"Pink",
                         @"Purple",
                         @"Deep Purple",
                         @"Indigo",
                         @"Blue",
                         @"Light Blue",
                         @"Cyan",
                         @"Teal",
                         @"Green",
                         @"Light Green",
                         @"Lime",
                         @"Yellow",
                         @"Amber",
                         @"Orange",
                         @"Deep Orange",
                         @"Brown",
                         @"Grey",
                         @"Blue Grey"
                         ];
    });
    return _colorGroups;
}

+ (NSDictionary *)colorPalette
{
    static NSDictionary *_colorPalette = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _colorPalette = @{
          // Red
          @"Red 50": @"#fde0dc",
          @"Red 100": @"#f9bdbb",
          @"Red 200": @"#f69988",
          @"Red 300": @"#f36c60",
          @"Red 400": @"#e84e40",
          @"Red 500": @"#e51c23",
          @"Red 600": @"#dd191d",
          @"Red 700": @"#d01716",
          @"Red 800": @"#c41411",
          @"Red 900": @"#b0120a",
          @"Red A100": @"#ff7997",
          @"Red A200": @"#ff5177",
          @"Red A400": @"#ff2d6f",
          @"Red A700": @"#e00032",
          
          // Pink
          @"Pink 50": @"#fce4ec",
          @"Pink 100": @"#f8bbd0",
          @"Pink 200": @"#f48fb1",
          @"Pink 300": @"#f06292",
          @"Pink 400": @"#ec407a",
          @"Pink 500": @"#e91e63",
          @"Pink 600": @"#d81b60",
          @"Pink 700": @"#c2185b",
          @"Pink 800": @"#ad1457",
          @"Pink 900": @"#880e4f",
          @"Pink A100": @"#ff80ab",
          @"Pink A200": @"#ff4081",
          @"Pink A400": @"#f50057",
          @"Pink A700": @"#c51162",
          
          // Purple
          @"Purple 50": @"#f3e5f5",
          @"Purple 100": @"#e1bee7",
          @"Purple 200": @"#ce93d8",
          @"Purple 300": @"#ba68c8",
          @"Purple 400": @"#ab47bc",
          @"Purple 500": @"#9c27b0",
          @"Purple 600": @"#8e24aa",
          @"Purple 700": @"#7b1fa2",
          @"Purple 800": @"#6a1b9a",
          @"Purple 900": @"#4a148c",
          @"Purple A100": @"#ea80fc",
          @"Purple A200": @"#e040fb",
          @"Purple A400": @"#d500f9",
          @"Purple A700": @"#aa00ff",
          
          // Deep Purple
          @"Deep Purple 50": @"#ede7f6",
          @"Deep Purple 100": @"#d1c4e9",
          @"Deep Purple 200": @"#b39ddb",
          @"Deep Purple 300": @"#9575cd",
          @"Deep Purple 400": @"#7e57c2",
          @"Deep Purple 500": @"#673ab7",
          @"Deep Purple 600": @"#5e35b1",
          @"Deep Purple 700": @"#512da8",
          @"Deep Purple 800": @"#4527a0",
          @"Deep Purple 900": @"#311b92",
          @"Deep Purple A100": @"#b388ff",
          @"Deep Purple A200": @"#7c4dff",
          @"Deep Purple A400": @"#651fff",
          @"Deep Purple A700": @"#6200ea",
          
          // Indigo
          @"Indigo 50": @"#e8eaf6",
          @"Indigo 100": @"#c5cae9",
          @"Indigo 200": @"#9fa8da",
          @"Indigo 300": @"#7986cb",
          @"Indigo 400": @"#5c6bc0",
          @"Indigo 500": @"#3f51b5",
          @"Indigo 600": @"#3949ab",
          @"Indigo 700": @"#303f9f",
          @"Indigo 800": @"#283593",
          @"Indigo 900": @"#1a237e",
          @"Indigo A100": @"#8c9eff",
          @"Indigo A200": @"#536dfe",
          @"Indigo A400": @"#3d5afe",
          @"Indigo A700": @"#304ffe",
          
          // Blue
          @"Blue 50": @"#e7e9fd",
          @"Blue 100": @"#d0d9ff",
          @"Blue 200": @"#afbfff",
          @"Blue 300": @"#91a7ff",
          @"Blue 400": @"#738ffe",
          @"Blue 500": @"#5677fc",
          @"Blue 600": @"#4e6cef",
          @"Blue 700": @"#455ede",
          @"Blue 800": @"#3b50ce",
          @"Blue 900": @"#2a36b1",
          @"Blue A100": @"#a6baff",
          @"Blue A200": @"#6889ff",
          @"Blue A400": @"#4d73ff",
          @"Blue A700": @"#4d69ff",
          
          // Light Blue
          @"Light Blue 50": @"#e1f5fe",
          @"Light Blue 100": @"#b3e5fc",
          @"Light Blue 200": @"#81d4fa",
          @"Light Blue 300": @"#4fc3f7",
          @"Light Blue 400": @"#29b6f6",
          @"Light Blue 500": @"#03a9f4",
          @"Light Blue 600": @"#039be5",
          @"Light Blue 700": @"#0288d1",
          @"Light Blue 800": @"#0277bd",
          @"Light Blue 900": @"#01579b",
          @"Light Blue A100": @"#80d8ff",
          @"Light Blue A200": @"#40c4ff",
          @"Light Blue A400": @"#00b0ff",
          @"Light Blue A700": @"#0091ea",
          
          // Cyan
          @"Cyan 50": @"#e0f7fa",
          @"Cyan 100": @"#b2ebf2",
          @"Cyan 200": @"#80deea",
          @"Cyan 300": @"#4dd0e1",
          @"Cyan 400": @"#26c6da",
          @"Cyan 500": @"#00bcd4",
          @"Cyan 600": @"#00acc1",
          @"Cyan 700": @"#0097a7",
          @"Cyan 800": @"#00838f",
          @"Cyan 900": @"#006064",
          @"Cyan A100": @"#84ffff",
          @"Cyan A200": @"#18ffff",
          @"Cyan A400": @"#00e5ff",
          @"Cyan A700": @"#00b8d4",
          
          // Teal
          @"Teal 50": @"#e0f2f1",
          @"Teal 100": @"#b2dfdb",
          @"Teal 200": @"#80cbc4",
          @"Teal 300": @"#4db6ac",
          @"Teal 400": @"#26a69a",
          @"Teal 500": @"#009688",
          @"Teal 600": @"#00897b",
          @"Teal 700": @"#00796b",
          @"Teal 800": @"#00695c",
          @"Teal 900": @"#004d40",
          @"Teal A100": @"#a7ffeb",
          @"Teal A200": @"#64ffda",
          @"Teal A400": @"#1de9b6",
          @"Teal A700": @"#00bfa5",
          
          // Green
          @"Green 50": @"#d0f8ce",
          @"Green 100": @"#a3e9a4",
          @"Green 200": @"#72d572",
          @"Green 300": @"#42bd41",
          @"Green 400": @"#2baf2b",
          @"Green 500": @"#259b24",
          @"Green 600": @"#0a8f08",
          @"Green 700": @"#0a7e07",
          @"Green 800": @"#056f00",
          @"Green 900": @"#0d5302",
          @"Green A100": @"#a2f78d",
          @"Green A200": @"#5af158",
          @"Green A400": @"#14e715",
          @"Green A700": @"#12c700",
          
          // Light Green
          @"Light Green 50": @"#f1f8e9",
          @"Light Green 100": @"#f1f8e9",
          @"Light Green 200": @"#c5e1a5",
          @"Light Green 300": @"#aed581",
          @"Light Green 400": @"#9ccc65",
          @"Light Green 500": @"#8bc34a",
          @"Light Green 600": @"#7cb342",
          @"Light Green 700": @"#689f38",
          @"Light Green 800": @"#558b2f",
          @"Light Green 900": @"#33691e",
          @"Light Green A100": @"#ccff90",
          @"Light Green A200": @"#b2ff59",
          @"Light Green A400": @"#76ff03",
          @"Light Green A700": @"#64dd17",
          
          // Lime
          @"Lime 50": @"#f9fbe7",
          @"Lime 100": @"#f0f4c3",
          @"Lime 200": @"#e6ee9c",
          @"Lime 300": @"#dce775",
          @"Lime 400": @"#d4e157",
          @"Lime 500": @"#cddc39",
          @"Lime 600": @"#c0ca33",
          @"Lime 700": @"#afb42b",
          @"Lime 800": @"#9e9d24",
          @"Lime 900": @"#827717",
          @"Lime A100": @"#f4ff81",
          @"Lime A200": @"#eeff41",
          @"Lime A400": @"#c6ff00",
          @"Lime A700": @"#aeea00",
          
          // Yellow
          @"Yellow 50": @"#fffde7",
          @"Yellow 100": @"#fff9c4",
          @"Yellow 200": @"#fff59d",
          @"Yellow 300": @"#fff176",
          @"Yellow 400": @"#ffee58",
          @"Yellow 500": @"#ffeb3b",
          @"Yellow 600": @"#fdd835",
          @"Yellow 700": @"#fbc02d",
          @"Yellow 800": @"#f9a825",
          @"Yellow 900": @"#f57f17",
          @"Yellow A100": @"#ffff8d",
          @"Yellow A200": @"#ffff00",
          @"Yellow A400": @"#ffea00",
          @"Yellow A700": @"#ffd600",
          
          // Amber
          @"Amber 50": @"#fff8e1",
          @"Amber 100": @"#ffecb3",
          @"Amber 200": @"#ffe082",
          @"Amber 300": @"#ffd54f",
          @"Amber 400": @"#ffca28",
          @"Amber 500": @"#ffc107",
          @"Amber 600": @"#ffb300",
          @"Amber 700": @"#ffa000",
          @"Amber 800": @"#ff8f00",
          @"Amber 900": @"#ff6f00",
          @"Amber A100": @"#ffe57f",
          @"Amber A200": @"#ffd740",
          @"Amber A400": @"#ffc400",
          @"Amber A700": @"#ffab00",
          
          // Orange
          @"Orange 50": @"#fff3e0",
          @"Orange 100": @"#ffe0b2",
          @"Orange 200": @"#ffcc80",
          @"Orange 300": @"#ffb74d",
          @"Orange 400": @"#ffa726",
          @"Orange 500": @"#ff9800",
          @"Orange 600": @"#fb8c00",
          @"Orange 700": @"#f57c00",
          @"Orange 800": @"#ef6c00",
          @"Orange 900": @"#e65100",
          @"Orange A100": @"#ffd180",
          @"Orange A200": @"#ffab40",
          @"Orange A400": @"#ff9100",
          @"Orange A700": @"#ff6d00",
          
          // Deep Orange
          @"Deep Orange 50": @"#fbe9e7",
          @"Deep Orange 100": @"#ffccbc",
          @"Deep Orange 200": @"#ffab91",
          @"Deep Orange 300": @"#ff8a65",
          @"Deep Orange 400": @"#ff7043",
          @"Deep Orange 500": @"#ff5722",
          @"Deep Orange 600": @"#f4511e",
          @"Deep Orange 700": @"#e64a19",
          @"Deep Orange 800": @"#d84315",
          @"Deep Orange 900": @"#bf360c",
          @"Deep Orange A100": @"#ff9e80",
          @"Deep Orange A200": @"#ff6e40",
          @"Deep Orange A400": @"#ff3d00",
          @"Deep Orange A700": @"#dd2c00",
          
          // Brown
          @"Brown 50": @"#efebe9",
          @"Brown 100": @"#d7ccc8",
          @"Brown 200": @"#bcaaa4",
          @"Brown 300": @"#a1887f",
          @"Brown 400": @"#8d6e63",
          @"Brown 500": @"#795548",
          @"Brown 600": @"#6d4c41",
          @"Brown 700": @"#5d4037",
          @"Brown 800": @"#4e342e",
          @"Brown 900": @"#4e342e",
          
          // Grey
          @"Grey 50": @"#fafafa",
          @"Grey 100": @"#f5f5f5",
          @"Grey 200": @"#eeeeee",
          @"Grey 300": @"#e0e0e0",
          @"Grey 400": @"#bdbdbd",
          @"Grey 500": @"#9e9e9e",
          @"Grey 600": @"#757575",
          @"Grey 700": @"#616161",
          @"Grey 800": @"#424242",
          @"Grey 900": @"#212121",
          @"Grey 1000": @"#000000",
          
          // Blue Grey
          @"Blue Grey 50": @"#eceff1",
          @"Blue Grey 100": @"#cfd8dc",
          @"Blue Grey 200": @"#b0bec5",
          @"Blue Grey 300": @"#90a4ae",
          @"Blue Grey 400": @"#78909c",
          @"Blue Grey 500": @"#607d8b",
          @"Blue Grey 600": @"#546e7a",
          @"Blue Grey 700": @"#455a64",
          @"Blue Grey 800": @"#37474f",
          @"Blue Grey 900": @"#263238"
          };
    });
    return _colorPalette;
}

@end
