//
//  SLTextViewTest.m
//  Subliminal
//
//  Created by Jeffrey Wear on 7/29/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SLTextViewTest : SLIntegrationTest

@end

@implementation SLTextViewTest {
    // `_textView` is id-typed so that it can represent `SLTextViews`
    // and `SLWebTextViews`
    id _textView;
}

+ (NSString *)testCaseViewControllerClassName {
    return @"SLTextViewTestViewController";
}

static NSString *const kExpectedText = @"foo";
- (void)setUpTestCaseWithSelector:(SEL)testCaseSelector {
    [super setUpTestCaseWithSelector:testCaseSelector];

    if ((testCaseSelector == @selector(testSetText)) ||
        (testCaseSelector == @selector(testGetText))) {
        _textView = [SLTextView elementWithAccessibilityLabel:@"test element"];
    }
}

- (void)testSetText {
}

- (void)testGetText {
}

@end
