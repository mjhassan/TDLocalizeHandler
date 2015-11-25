//
//  TDLocalizer.h
//  Blaffer
//
//  Created by Jahid on 11/24/15.
//  Copyright © 2015 Hitchhike. All rights reserved.
//
/*
 * courtesy from Battle of Puppets
 */


#import <Foundation/Foundation.h>

#define TDLocalizedString(key, comment) \
[[TDLocalizer sharedSystem] localizedStringForKey:(key) value:(comment)]

#define LocalizationSetLanguage(language) \
[[TDLocalizer sharedSystem] setLanguage:(language)]

#define LocalizationGetLanguage \
[[TDLocalizer sharedSystem] getLanguage]

#define LocalizationReset \
[[TDLocalizer sharedSystem] resetLocalization]

@interface TDLocalizer : NSObject {
    NSString *language;
}

// you really shouldn't care about this functions and use the MACROS
+ (instancetype)sharedSystem;

//gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

//sets the language
- (void) setLanguage:(NSString*) language;

//gets the current language
- (NSString*) getLanguage;

//resets this system.
- (void) resetLocalization;

@end
