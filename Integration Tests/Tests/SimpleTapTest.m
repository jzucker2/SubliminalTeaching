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

// If you override set-up methods,
// you must call super at the beginning of your implementations.

// If you override tear-down methods,
// you must call super at the *end* of your implementations.

- (void)testVerifyInitialLabelAndTapToChangeValue
{
    // The label will change values when the button is tapped. Verify
    // the initial starting value of the label and that it changes
    // as expected
}

@end
