//
//  ViewController.h
//  Alert and ActionView
//
//  Created by william pugh on 6/22/13.
//  Copyright (c) 2013 william pugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIActionSheetDelegate, UIAlertViewDelegate>

- (IBAction)alertButtonTapped:(id)sender;
- (IBAction)actionSheetButtonTapped:(id)sender;
- (IBAction)textInputAlertButton:(id)sender;
- (IBAction)barButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *alertViewTextInputLabel;
@property (weak, nonatomic) IBOutlet UILabel *alertViewTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *alertViewButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionSheetTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionSheetButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionSheetTagLabel;


@end
