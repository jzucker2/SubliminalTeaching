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

- (void)testUseAppHookToSetButtonLabel {
    SLElement *testLabelFoo = [SLElement elementWithAccessibilityLabel:@"foo"];
    // put code here
    SLAskApp(setNewLabelValue);

    // now test should pass
    SLElement *testLabelBar = [SLElement elementWithAccessibilityLabel:@"bar"];
    SLAssertFalse([testLabelFoo isValidAndVisible], @"foo stayed the same");
    SLAssertTrue([[testLabelBar label] isEqualToString:@"bar"], @"label text did not change");
}

@end
