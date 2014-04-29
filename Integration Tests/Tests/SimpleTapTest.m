//
//  SimpleTapTest.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/29/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SimpleTapTest : SLIntegrationTest

@end

@implementation SimpleTapTest

+ (NSString *)testCaseViewControllerClassName {
    return @"SimpleTapTestViewController";
}

- (void)testVerifyInitialLabelAndTapToChangeValue
{
    // The label will change values when the button is tapped. Verify
    // the initial starting value of the label and that it changes
    // as expected
    SLButton *testButton = [SLButton elementWithAccessibilityLabel:@"test button"];
    SLAssertTrue([UIAElement(testButton) isValidAndVisible], @"did not find test button as expected");

    SLElement *testLabel = [SLElement elementWithAccessibilityLabel:@"untapped"];
    SLAssertTrue([UIAElement(testLabel) isValidAndVisible], @"test label was not found");

    [UIAElement(testButton) tap];

    SLAssertFalse([UIAElement(testLabel) isValidAndVisible], @"label remained the same");
    testLabel = [SLElement elementWithAccessibilityLabel:@"tapped"];
    SLAssertTrue([UIAElement(testLabel) isValidAndVisible], @"label did not update as expected");
}

@end
