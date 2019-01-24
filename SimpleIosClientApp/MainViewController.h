//
//  MainViewController.h
//  SimpleIosClientApp
//
//  Created by Ulrik Gammelby on 12/09/2018.
//  Copyright © 2018 Nabto ApS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *idField;
@property (nonatomic, strong) UITextField *keyField;
@property (nonatomic, strong) UILabel *label;
@end
