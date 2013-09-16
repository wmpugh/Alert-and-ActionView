//
//  ViewController.m
//  Alert and ActionView
//
//  Created by william pugh on 6/22/13.
//  Copyright (c) 2013 william pugh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.alertViewTitleLabel.hidden = YES;
    self.alertViewButtonLabel.hidden = YES;
    self.alertViewTextInputLabel.hidden = YES;
    self.actionSheetButtonLabel.hidden = YES;
    self.actionSheetTitleLabel.hidden = YES;
    self.actionSheetTagLabel.hidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)alertButtonTapped:(id)sender
{
    self.alertViewTitleLabel.hidden = YES;
    self.alertViewButtonLabel.hidden = YES;
    self.actionSheetButtonLabel.hidden = YES;
    self.actionSheetTitleLabel.hidden = YES;
    self.actionSheetTagLabel.hidden = YES;

    UIAlertView *defaultAlertView = [[UIAlertView alloc] initWithTitle:@"Alert View Demo 1"
                                                               message:@"the default alert view style"
                                                              delegate:nil
                                                     cancelButtonTitle:@"continue"
                                                     otherButtonTitles:nil];
    defaultAlertView.alertViewStyle = UIAlertViewStyleDefault;
    [defaultAlertView show];
}


- (IBAction)textInputAlertButton:(id)sender
{
    self.alertViewTitleLabel.hidden = NO;
    self.alertViewButtonLabel.hidden = NO;
    self.actionSheetButtonLabel.hidden = YES;
    self.actionSheetTitleLabel.hidden = YES;
    self.actionSheetTagLabel.hidden = YES;
    
    UIAlertView *plainTextAlertView = [[UIAlertView alloc] initWithTitle:@"Alert View Demo 2"
                                                                 message:@"the plain text alert view style"
                                                                delegate:self
                                                       cancelButtonTitle:@"Cancel"
                                                       otherButtonTitles:@"Done", nil];
    plainTextAlertView.tag = 1;
    plainTextAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [plainTextAlertView show];
    
  
}



#pragma mark -
#pragma mark - AlertView Delegate Methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   /*  
    if you set the delegate for more than one AlertView then you need to distinguish between them when this delegate method is called.
    This is done by setting a tag property when the AlertView is created and evaluating it here in the delegate or by evaluating the title property.  
    This example uses the title property.
    
    You also need to know which button was tapped in the AlertView.  The buttonIndex provides this information.
    
    If you don't need to know that an AlertView was triggered then set the delegate to nil and don't include the delegate methods.
    */
    self.alertViewButtonLabel.text = [NSString stringWithFormat:@"%d",buttonIndex];    
    self.alertViewTitleLabel.text = alertView.title;
    if ([alertView.title isEqual: @"Alert View Demo 2"])
    {
        UITextField *textField = [alertView textFieldAtIndex:0];
        switch (buttonIndex) {
            case 0:
                self.alertViewTextInputLabel.text = @"";
                break;
            case 1:
                self.alertViewTextInputLabel.hidden = NO;
                self.alertViewTextInputLabel.text = textField.text;
                break;
            default:
                break;
        }
    }
}


- (IBAction)actionSheetButtonTapped:(id)sender
{
    self.alertViewTitleLabel.hidden = YES;
    self.alertViewButtonLabel.hidden = YES;
    self.actionSheetButtonLabel.hidden = NO;
    self.actionSheetTitleLabel.hidden = NO;
    self.actionSheetTagLabel.hidden = NO;
    
    NSString *actionSheetTitle = @"Action Sheet Demo 1"; 
    NSString *destructiveTitle = @"About to do something destructive"; 
    NSString *choice1 = @"Choice 1";
    NSString *choice2 = @"Choice 2";
    NSString *choice3 = @"Choice 3";
    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle
															 delegate:self
													cancelButtonTitle:cancelTitle
											   destructiveButtonTitle:destructiveTitle
													otherButtonTitles:choice1, choice2, choice3, nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag = 0;
    [actionSheet showInView:self.view];
}



- (IBAction)barButtonTapped:(id)sender
{
    self.alertViewTitleLabel.hidden = YES;
    self.alertViewButtonLabel.hidden = YES;
    self.actionSheetButtonLabel.hidden = NO;
    self.actionSheetTitleLabel.hidden = NO;
    self.actionSheetTagLabel.hidden = NO;
    
    NSString *actionSheetTitle = @"Action Sheet Demo 2";
    NSString *destructiveTitle = @"About to do something destructive"; 
    NSString *choice1 = @"Choice 1";
    NSString *choice2 = @"Choice 2";
    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle
															 delegate:self
													cancelButtonTitle:cancelTitle
											   destructiveButtonTitle:destructiveTitle
													otherButtonTitles:choice1, choice2, nil];

    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    actionSheet.tag = 1;
    [actionSheet showInView:self.view];
}


#pragma mark -
#pragma mark UIActionSheetDelegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    /*
     if you set the delegate for more than one UIActionSheet then you need to distinguish between them when this delegate method is called.
     This is done by setting a tag property when the action sheet is created and evaluating it here in the delegate or by evaluating the title property.
     This example uses the tag property.
     
     You also need to know which button was tapped in the action sheet.  The buttonTitleAtIndex method provides this information.
     
     Action sheets are about giving the user choices so there will always be at least two buttons.  This means that this delegate method will always need to be used to identify the tapped button.
     */
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    self.actionSheetTitleLabel.text = buttonTitle;
    self.actionSheetTagLabel.text = [NSString stringWithFormat:@"%d",actionSheet.tag];
    switch (actionSheet.tag)
    {
        case 0:
            if ([buttonTitle isEqualToString:@"Destructive Button"])
            {
                self.actionSheetButtonLabel.text = @"destructive button tapped";
            }
            if ([buttonTitle isEqualToString:@"Choice 1"])
            {
                self.actionSheetButtonLabel.text = @"Choice 1 tapped";
            }
            if ([buttonTitle isEqualToString:@"Choice 2"])
            {
                self.actionSheetButtonLabel.text = @"Choice 2 tapped";
            }
            if ([buttonTitle isEqualToString:@"Choice 3"])
            {
                self.actionSheetButtonLabel.text = @"Choice 3 tapped";
            }
            if ([buttonTitle isEqualToString:@"Cancel Button"])
            {
                self.actionSheetButtonLabel.text = @"cancel button tapped";
            }
            break;
        case 1:
            if ([buttonTitle isEqualToString:@"Destructive Button"])
            {
                self.actionSheetButtonLabel.text = @"destructive button tapped";
            }
            if ([buttonTitle isEqualToString:@"Choice 1"])
            {
                self.actionSheetButtonLabel.text = @"Choice 1 tapped";
            }
            if ([buttonTitle isEqualToString:@"Choice 2"])
            {
                self.actionSheetButtonLabel.text = @"Choice 2 tapped";
            }
            if ([buttonTitle isEqualToString:@"Cancel Button"])
            {
                self.actionSheetButtonLabel.text = @"cancel button tapped";
            }
            break;
        default:
            break;
    }
    
}


@end
