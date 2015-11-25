//
//  ViewController.m
//  TDLocalizeHandlerDemo
//
//  Created by Jahid on 11/25/15.
//  Copyright © 2015 Jahid. All rights reserved.
//

#import "ViewController.h"
#import "TDLocalizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"kChangeOnTheFlyButtonTitile"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification * _Nonnull note) {
                                                      NSLog(@"%@", TDLocalizedString(@"button.title", @"Translate the message"));
                                                      [_translateButton setTitle:TDLocalizedString(@"button.title", nil) forState:UIControlStateNormal];
                                                  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)translate:(id)sender {
    _displayLabel.text = TDLocalizedString(@"pre-storedMap", @"translate using selected lan. check Local");
}

@end
