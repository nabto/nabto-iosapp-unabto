//
//  MainViewController.m
//  SimpleIosClientApp
//
//  Created by Ulrik Gammelby on 12/09/2018.
//  Copyright © 2018 Nabto ApS. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)createTextField {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 30.0f, 300.0f, 30.0f)];
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
}

- (void)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(110.0f, 200.0f, 100.0f, 30.0f);
    [button addTarget:self
               action:@selector(buttonPressed)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Press Me!" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)createLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(115.0f, 150.0f, 200.0f, 30.0f)];
    self.label.text = @"Hello World!";
    [self.view addSubview:self.label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTextField];
    [self createButton];
    [self createLabel];
}

- (void)buttonPressed {
    self.label.text = self.textField.text;
    NSLog(@"Button pressed!");
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
