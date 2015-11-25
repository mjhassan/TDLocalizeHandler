//
//  ButtonContainer.h
//  TDLocalizeHandlerDemo
//
//  Created by Jahid on 11/25/15.
//  Copyright © 2015 Jahid. All rights reserved.
//

#import <UIKit/UIKit.h>

#define lan @[@"English", @"Bengali", @"Chinese", @"Japanese", @"Arabic", @"French", @"Spanish",  @"Russian", @"Portuguese"]

@interface ButtonContainer : UIView {
    IBOutlet UIButton* enButton;
    IBOutlet UIButton* bnButton;
    IBOutlet UIButton* chButton;
    IBOutlet UIButton* jpButton;
    IBOutlet UIButton* arButton;
    IBOutlet UIButton* frButton;
    IBOutlet UIButton* esButton;
    IBOutlet UIButton* rsButton;
    IBOutlet UIButton* prButton;
}

@end
