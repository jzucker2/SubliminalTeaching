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
        testSelector == @selector(testSetTextCanHandleTapHoldCharacters) ||
        testSelector == @selector(testSetTextClearsCurrentText) ||
        testSelector == @selector(testSetTextWhenFieldClearsOnBeginEditing) ||
        testSelector == @selector(testGetText) ||
        testSelector == @selector(testDoNotMatchEditorAccessibilityObjects) ||
        testSelector == @selector(testClearTextButton)) {
        _textField = [SLTextField elementWithAccessibilityLabel:@"test element"];
    } else if (testSelector == @selector(testMatchesSearchBarTextField) ||
               testSelector == @selector(testSetSearchBarText) ||
               testSelector == @selector(testGetSearchBarText)) {
        _textField = [SLSearchField anyElement];
    }
}

#pragma mark - SLTextField test cases

- (void)testSetText {
}

- (void)testGetTextFromTextField {
    // value in text field should be @"foo"
}

- (void)testClearTextButton {
    SLAssertFalse([SLAskApp(text) isEqualToString:@""],
                  @"For the purposes of this test case, the text field must have some initial value.");
}

//#pragma mark - SLSearchField test cases
//
//- (void)testMatchesSearchBarTextField {
//    SLAssertTrue([UIAElement(_textField) isValid], @"Search bar should be valid.");
//    SLAssertTrue([[UIAElement(_textField) text] isEqualToString:@"bar"], @"Did not match expected element.");
//}
//
//- (void)testSetSearchBarText {
//    NSString *const expectedText = @"bar";
//    SLAssertNoThrow([UIAElement(_textField) setText:expectedText], @"Should not have thrown.");
//    SLAssertTrue([SLAskApp(text) isEqualToString:expectedText], @"Text was not set to expected value.");
//}
//
//- (void)testGetSearchBarText {
//    NSString *text;
//    SLAssertNoThrow(text = [UIAElement(_textField) text], @"Should not have thrown.");
//    SLAssertTrue([text isEqualToString:@"bar"], @"Retrieved unexpected text: %@.", text);
//}
@end
