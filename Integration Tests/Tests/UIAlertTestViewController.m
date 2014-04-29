//
//  UIAlertTestViewController.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/29/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTestCaseViewController.h"

#import <Subliminal/SLTestController+AppHooks.h>

@interface UIAlertTestViewController : SLTestCaseViewController
- (IBAction)showAlert:(id)sender;

@end

@interface UIAlertTestViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (nonatomic, weak) IBOutlet UITextField *alertTitleTextField;
@property (nonatomic, weak) IBOutlet UITextField *alertOtherTextField;
@property (nonatomic, weak) IBOutlet UITextField *alertCancelTextField;
@property (nonatomic, weak) IBOutlet UIButton *showAlertButton;
@end

@implementation UIAlertTestViewController {
    UIAlertView *_activeAlertView;
}

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"UIAlertTestViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _alertTitleTextField.isAccessibilityElement = YES;
    _alertTitleTextField.accessibilityIdentifier = @"alert title";

    _alertOtherTextField.isAccessibilityElement = YES;
    _alertOtherTextField.accessibilityIdentifier = @"alert other";

    _alertCancelTextField.isAccessibilityElement = YES;
    _alertCancelTextField.accessibilityIdentifier = @"alert cancel";

    _showAlertButton.enabled = NO;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableAlertButton) name:UITextFieldTextDidChangeNotification object:nil];
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
        // Register for app hooks, e.g.
        [[SLTestController sharedTestController] registerTarget:self forAction:@selector(dismissActiveAlertAndClearTitleOfLastButtonClicked)];
    }
    return self;
}

// Deregister for app hooks, if any
- (void)dealloc {
    [[SLTestController sharedTestController] deregisterTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)showAlert:(id)sender
{
    [self showAlertWithInfo:@{@"title": _alertTitleTextField.text, @"cancel": _alertCancelTextField.text, @"other": _alertOtherTextField.text}];
}

- (void)enableAlertButton
{
    if (_alertTitleTextField.text && _alertOtherTextField.text && _alertCancelTextField.text) {
        _showAlertButton.enabled = YES;
    }
}

#pragma mark - App hooks
// Put any app hooks below here
- (void)dismissActiveAlertAndClearTitleOfLastButtonClicked {
    if (_activeAlertView.numberOfButtons == 0) {
        // the alert shown by testDismissThrowsAbsentBothCancelAndDefaultButtons has no buttons
        // it appears that it can be dismissed with dismissWithClickedButtonIndex:0 even so,
        // but just to be safe...
        [_activeAlertView addButtonWithTitle:@"Dismiss"];
    }
    [_activeAlertView dismissWithClickedButtonIndex:0 animated:YES];
    _activeAlertView = nil;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UIAlertViewDelegate
- (void)showAlertWithTitle:(NSString *)title {
    [self showAlertWithInfo:@{ @"title": title, @"cancel": @"Ok" }];
}

- (void)showAlertWithInfo:(NSDictionary *)info {
    _activeAlertView = [[UIAlertView alloc] initWithTitle:info[@"title"]
                                                  message:nil
                                                 delegate:self
                                        cancelButtonTitle:info[@"cancel"]
                                        otherButtonTitles:info[@"other"], nil];
    NSNumber *styleNumber = info[@"style"];
    if (styleNumber) {
        UIAlertViewStyle style;
        [styleNumber getValue:&style];
        _activeAlertView.alertViewStyle = style;
    }
    [_activeAlertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {

    _activeAlertView = nil;
}

@end
