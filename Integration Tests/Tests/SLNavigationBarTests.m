//
//  SLNavigationBarTests.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/4/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SLNavigationBarTests : SLIntegrationTest
@end

@implementation SLNavigationBarTests

+ (NSString *)testCaseViewControllerClassName {
    return @"SLNavigationBarTestsViewController";
}

- (void)testRightButtonByMatchingChildElementInNavBar
{
    // UINavigationBar has ax identifier @"NavigationBar"
    SLAssertTrue(NO, @"have not written test yet");
}

- (void)testTitleLabelByMatchingChildElementInNavBar
{
    // UINavigationBar has ax identifier @"NavigationBar"
    SLAssertTrue(NO, @"have not written test yet");
}

@end
