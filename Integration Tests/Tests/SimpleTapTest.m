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

    SLAssertTrue(NO, @"have not written test yet");
}

@end
