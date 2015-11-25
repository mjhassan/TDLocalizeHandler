//
//  ButtonContainer.m
//  TDLocalizeHandlerDemo
//
//  Created by Jahid on 11/25/15.
//  Copyright © 2015 Jahid. All rights reserved.
//

#import "ButtonContainer.h"
#import "TDLocalizer.h"

@implementation ButtonContainer

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self buttonSelected:enButton];
}

- (IBAction)buttonSelected:(UIButton*)sender {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = NO;
    }];
    sender.selected = YES;
    
    LocalizationSetLanguage(lan[sender.tag]);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kChangeOnTheFlyButtonTitile" object:nil];
}

@end
