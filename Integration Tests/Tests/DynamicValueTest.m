//
//  DynamicValueTest.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/28/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface DynamicValueTest : SLIntegrationTest

@end

@implementation DynamicValueTest

+ (NSString *)testCaseViewControllerClassName {
    return @"DynamicValueTestViewController";
}

- (void)testSetIdentifierToTestChangingLabelAndValueUpdates {
    // matching for UIButton change matching to use identifier not label
    SLElement *testLabel = [SLElement elementWithAccessibilityIdentifier:@"foo"];

    // don't change test below
    SLAssertTrue([testLabel isValidAndVisible], @"test label was not found");
    SLAssertTrue([testLabel.label isEqualToString:@"foo"], @"testLabel ax label is foo");
    SLAssertTrue([testLabel.value isEqualToString:@"foo"], @"testLabel ax label is bar");

    SLButton *testButton = [SLButton elementWithAccessibilityLabel:@"Change to Bar"];
    [UIAElement(testButton) tap];

    SLAssertTrue([testLabel isValidAndVisible], @"test label still exists");
    SLAssertTrue([testLabel.label isEqualToString:@"bar"], @"test label did not change ax label");
    SLAssertTrue([testLabel.value isEqualToString:@"bar"], @"test label ax value changed as expected");
}

- (void)testSubclassLabelRemainsConstantButValueUpdates {
    // Matching for subclassed UIButton
    // can match for label because it is controlled, set to whatever you supply in SubclassLabel.m
	SLElement *subclassLabel = [SLElement elementWithAccessibilityLabel:@"foo"];

    // don't change rest of test below
    SLAssertTrue([subclassLabel isValidAndVisible], @"test label was not found");
    SLAssertTrue([subclassLabel.value isEqualToString:@"foo"], @"testLabel ax label is bar");

    SLButton *testButton = [SLButton elementWithAccessibilityLabel:@"Change to Bar"];
    [UIAElement(testButton) tap];

    SLAssertTrue([subclassLabel isValidAndVisible], @"test label still exists");
    SLAssertTrue([subclassLabel.label isEqualToString:@"foo"], @"test label should have kept ax label");
    SLAssertFalse([subclassLabel.label isEqualToString:@"bar"], @"test label should not have updated ax label");
    SLAssertTrue([subclassLabel.value isEqualToString:@"bar"], @"test label ax value changed as expected");
}

@end
