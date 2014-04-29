//
//  SLTableViewCellChildElementsTest.m
//  Subliminal
//
//  Created by Jordan Zucker on 3/20/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SLTableViewCellChildElementsTest : SLIntegrationTest

@end

@implementation SLTableViewCellChildElementsTest

+ (NSString *)testCaseViewControllerClassName {
    return @"SLTableViewCellChildElementsTestViewController";
}

- (void)testTapTableViewCellButtonByMatchingFirstAccessibilityLabel {
    SLButton *favorite = [SLButton elementWithAccessibilityLabel:@"Favorite"];
    SLAssertTrue([favorite isValidAndVisible], @"does not exist");
    SLAssertTrue([favorite.value isEqualToString:@"off"], @"was not off originally");
    [favorite tap];
    SLAssertTrue([favorite isValidAndVisible], @"disappeared");
    SLAssertTrue([favorite.value isEqualToString:@"on"], @"did not update");

}

- (void)testMatchingTableViewCellWithSLTableViewCellMethod
{
    SLTableViewCell *cell = [SLTableViewCell elementWithAccessibilityLabel:@"Cell 2"];
    SLAssertTrue([cell isValidAndVisible], @"did not appear");
}

- (void)testMatchingTableViewCellChildElementWithSLTableViewCellMethod
{
    SLTableViewCell *cell = [SLTableViewCell elementWithAccessibilityLabel:@"Cell 2"];
    SLAssertTrue([cell isValidAndVisible], @"did not appear");
    SLButton *favoriteButton = [cell childElementMatching:[SLButton elementWithAccessibilityLabel:@"Favorite"]];
    SLAssertTrue([favoriteButton isValidAndVisible], @"did not appear as expected");
    SLAssertTrue([favoriteButton.value isEqualToString:@"off"], @"favorite button did not start off");
    [favoriteButton tap];
    SLAssertTrue([favoriteButton.value isEqualToString:@"on"], @"favorite button value changed");
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"end of test"];
    [cell captureScreenshotWithFilename:@"hey"];
}

@end
