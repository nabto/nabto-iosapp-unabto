//
//  MainViewController.m
//  SimpleIosClientApp
//
//  Created by Ulrik Gammelby on 12/09/2018.
//  Copyright © 2018 Nabto ApS. All rights reserved.
//

#import "MainViewController.h"
#include "../unabto_ios_lib/src/unabto_app_runner.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)createIdField {
    self.idField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 30.0f, 300.0f, 30.0f)];
    self.idField.delegate = self;
    self.idField.borderStyle = UITextBorderStyleRoundedRect;
    self.idField.text = @"iostream.test.nabto.net";
    [self.view addSubview:self.idField];
}

- (void)createKeyField {
    self.keyField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 80.0f, 300.0f, 30.0f)];
    self.keyField.delegate = self;
    self.keyField.borderStyle = UITextBorderStyleRoundedRect;
    self.keyField.text = @"";
    [self.view addSubview:self.keyField];
}


- (void)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(110.0f, 200.0f, 100.0f, 30.0f);
    [button addTarget:self
               action:@selector(buttonPressed)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Start device" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)createLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 150.0f, 300.0f, 30.0f)];
    self.label.text = @"Enter a device id and press start";
    [self.view addSubview:self.label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createIdField];
    [self createKeyField];
    [self createButton];
    [self createLabel];
}

- (void)buttonPressed {
    const char* id = [self.idField.text UTF8String];
    const char* key = [self.keyField.text length] > 0 ? [self.keyField.text UTF8String] : NULL;
    self.label.text = @"Running...";
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        if (start_unabto_app(id, key)) {
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.label.text = @"uNabto finished ok";
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.label.text = @"uNabto failed";
            });
        }
    });
}
 
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // this tells the operating system to remove the keyboard from the forefront
    [textField resignFirstResponder];
    return NO; // instead of adding a line break, the text field resigns
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
