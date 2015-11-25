//
//  TDLocalizer.m
//  Blaffer
//
//  Created by Jahid on 11/24/15.
//  Copyright © 2015 Hitchhike. All rights reserved.
//
/*
 * courtesy from Battle of Puppets
 */

#import "TDLocalizer.h"

//Singleton instance
static TDLocalizer* _sharedObject = nil;

//Current application bungle to get the languages.
static NSBundle *bundle = nil;

@implementation TDLocalizer

+ (instancetype)sharedSystem {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_sharedObject){
            _sharedObject = [self new];
        }
    });
    
    return _sharedObject;
}

#pragma mark-
- (instancetype)init {
    if ((self = [super init])) {
        //empty.
        bundle = [NSBundle mainBundle];
    }
    
    return self;
}

// Gets the current localized string as in NSLocalizedString.
//
// example calls:
// TDLocalizedString(@"Text to localize",  @"Alternative text, in case hte other is not find");
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment {
    return [bundle localizedStringForKey:key value:comment table:nil];
}

// Sets the desired language of the ones you have.
// example calls:
// LocalizationSetLanguage(@"Italian");
// LocalizationSetLanguage(@"German");
// LocalizationSetLanguage(@"Spanish");
//
// If this function is not called it will use the default OS language.
// If the language does not exists y returns the default OS language.
- (void) setLanguage:(NSString*) l {
    NSLog(@"preferredLang: %@", l);
    
    NSString *path = [[ NSBundle mainBundle ] pathForResource:l ofType:@"lproj" ];
    
    if (path == nil) {
        //in case the language does not exists
        [self resetLocalization];
    }
    else {
        bundle = [NSBundle bundleWithPath:path];
    }
}

// Just gets the current setted up language.
// returns "es","fr",...
//
// example call:
// NSString * currentL = LocalizationGetLanguage;
- (NSString*) getLanguage{
    NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    
    return languages[0];
}

// Resets the localization system, so it uses the OS default language.
//
// example call:
// LocalizationReset;
- (void) resetLocalization {
    bundle = [NSBundle mainBundle];
}

@end
