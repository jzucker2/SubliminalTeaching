//
//  SLTextFieldTest.m
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

#import "SLIntegrationTest.h"

@interface SLTextFieldTest : SLIntegrationTest

@end

@implementation SLTextFieldTest {
    // _textField is id-typed so that it can represent SLTextFields
    // and SLWebTextFields
    id _textField;
}

+ (NSString *)testCaseViewControllerClassName {
    return @"SLTextFieldTestViewController";
}

- (void)setUpTestCaseWithSelector:(SEL)testSelector {
    [super setUpTestCaseWithSelector:testSelector];

    if (testSelector == @selector(testSetText) ||
        testSelector == @selector(setTextAndTapSignInEnabledAfterTyping) ||
        testSelector == @selector(testGetTextFromTextField) ||
        testSelector == @selector(testClearTextButton)) {
        _textField = [SLTextField elementWithAccessibilityLabel:@"test element"];
    }
}

#pragma mark - SLTextField test cases

- (void)testSetText {
    // fill out test below
    SLAssertTrue(NO, @"have not written test yet");
}

- (void)testGetTextFromTextField {
    // value in text field should be @"foo"
    SLAssertTrue(NO, @"have not written test yet");
}

- (void)testClearTextButton {
    SLAssertFalse([SLAskApp(text) isEqualToString:@""],
                  @"For the purposes of this test case, the text field must have some initial value.");

    SLButton *clearButton = [SLButton elementWithAccessibilityLabel:@"Clear text"];
    // enter code here

    // placeholder below so we can have a reference to the clear button
    SLLogAsync(@"clearButton is %@", clearButton);

    
    // now test should be passing because text is cleared
    SLAssertTrue([SLAskApp(text) isEqualToString:@""], @"Text was not cleared after tapping clear button.");
}

- (void)testSetTextAndTapSignInEnabledAfterTyping
{
    SLButton *signInButton = [SLButton elementWithAccessibilityLabel:@"Sign in"];
    SLAssertTrue([UIAElement(signInButton) isValidAndVisible], @"sign in button does not exist");
    SLAssertFalse([UIAElement(signInButton) isEnabled], @"sign in button starts disabled");
    // fill out below to type in text field and enable sign in button



    // this will fail until a string is typed in the text field (even though text is
    // already there to start)
    SLAssertTrue([UIAElement(signInButton) isEnabled], @"sign in button is now enabled");
}

@end
