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
    SLNavigationBar *navBar = [SLNavigationBar elementWithAccessibilityIdentifier:@"NavigationBar"];
    SLButton *rightButton = [navBar childElementMatching:[SLButton elementWithAccessibilityLabel:@"Right"]];
    SLAssertTrue([rightButton isValidAndVisible], @"right button");
}

- (void)testTitleLabelByMatchingChildElementInNavBar
{
    // UINavigationBar has ax identifier @"NavigationBar"
    SLNavigationBar *navBar = [SLNavigationBar elementWithAccessibilityIdentifier:@"NavigationBar"];
    SLElement *title = [navBar childElementMatching:[SLElement elementWithAccessibilityLabel:@"Testing"]];
    SLAssertTrue([title isValidAndVisible], @"right button");
}

@end
