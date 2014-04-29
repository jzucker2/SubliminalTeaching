//
//  SLAppHookTest.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/28/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SLAppHookTest : SLIntegrationTest

@end

@implementation SLAppHookTest

+ (NSString *)testCaseViewControllerClassName {
    return @"SLAppHookTestViewController";
}

// If you override set-up methods,
// you must call super at the beginning of your implementations.

// If you override tear-down methods,
// you must call super at the *end* of your implementations.

- (void)testUseAppHookToSetButtonLabel {
    SLElement *testLabelFoo = [SLElement elementWithAccessibilityLabel:@"foo"];
    // put code here

    SLAskApp(setLabel);
    // now test should pass
    SLElement *testLabelBar = [SLElement elementWithAccessibilityLabel:@"bar"];
    SLAssertFalse([testLabelFoo isValidAndVisible], @"foo stayed the same");
    SLAssertTrue([[testLabelBar label] isEqualToString:@"bar"], @"label text did not change");
}

@end
