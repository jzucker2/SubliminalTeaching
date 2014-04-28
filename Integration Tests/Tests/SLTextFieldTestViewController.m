//
//  SLTextFieldTestViewController.m
//  Subliminal
//
//  For details and documentation:
//  http://github.com/inkling/Subliminal
//
//  Copyright 2013-2014 Inkling Systems, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "SLTestCaseViewController.h"

#import <Subliminal/SLTestController+AppHooks.h>
#import <QuartzCore/QuartzCore.h>

@interface SLTextFieldTestViewController : SLTestCaseViewController
@end

@implementation SLTextFieldTestViewController {
    UITextField *_textField;
    UIButton *_signInButton;
}

- (void)loadViewForTestCase:(SEL)testCase {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    const CGRect kTextFieldFrame = (CGRect){CGPointZero, CGSizeMake(100.0f, 30.0f)};
    if (testCase == @selector(testSetText) ||
        testCase == @selector(testGetTextFromTextField) ||
        testCase == @selector(testClearTextButton) ||
        testCase == @selector(testSetTextAndTapSignInEnabledAfterTyping)) {

        _textField = [[UITextField alloc] initWithFrame:kTextFieldFrame];
        [view addSubview:_textField];
    }
    if (testCase == @selector(testSetTextAndTapSignInEnabledAfterTyping)) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableSignInButton) name:UITextFieldTextDidChangeNotification object:nil];

        _signInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
        _signInButton.enabled = NO;
        _signInButton.isAccessibilityElement = YES;
        _signInButton.accessibilityLabel = @"Sign in";
        _signInButton.frame = CGRectMake(100, 30, 100, 30);
        [view addSubview:_signInButton];
    }
    self.view = view;
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
        [[SLTestController sharedTestController] registerTarget:self forAction:@selector(text)];
    }
    return self;
}

- (void)dealloc {
    [[SLTestController sharedTestController] deregisterTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _textField.accessibilityLabel = @"test element";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    if (self.testCase == @selector(testClearTextButton)) {
        _textField.clearButtonMode = UITextFieldViewModeAlways;
    }

    if (self.testCase != @selector(testSetText)) {
        _textField.text = @"foo";
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    // move the textfield above the keyboard
    static const CGFloat kTextFieldVerticalOffset = -40.0f;

    CGPoint textFieldCenter = CGPointMake(self.view.center.x, self.view.center.y + kTextFieldVerticalOffset);
    _textField.center = textFieldCenter;
}

#pragma mark - App hooks

- (NSString *)text {
    NSString *text;
    if (self.testCase == @selector(testSetText) ||
        self.testCase == @selector(testGetTextFromTextField) ||
        self.testCase == @selector(testClearTextButton) ||
        self.testCase == @selector(testSetTextAndTapSignInEnabledAfterTyping)) {
        text = _textField.text;
    }
    return text;
}

- (void)enableSignInButton
{
    _signInButton.enabled = YES;
}

@end
