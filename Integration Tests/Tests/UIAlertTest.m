//
//  UIAlertTest.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/29/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface UIAlertTest : SLIntegrationTest
@property (nonatomic) SLButton *showAlertButton;
@property (nonatomic) SLTextField *alertTitleTextField;
@property (nonatomic) SLTextField *alertOtherTextField;
@property (nonatomic) SLTextField *alertCancelTextField;
@end

@implementation UIAlertTest

+ (NSString *)testCaseViewControllerClassName {
    return @"UIAlertTestViewController";
}

- (void)setUpTestCaseWithSelector:(SEL)testCaseSelector
{
    [super setUpTestCaseWithSelector:testCaseSelector];
    // Set subliminal ivar elements here
}

- (void)tearDownTestCaseWithSelector:(SEL)testCaseSelector {
    SLAskApp(dismissActiveAlertAndClearTitleOfLastButtonClicked);

    [super tearDownTestCaseWithSelector:testCaseSelector];
}

- (void)testHandleParticularAlert {
    // first set alert handler

    // Use TextField handling to fill out alert info below


    // code to tap button to display alert below

    // now wait for alert
    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // now test that alert appeared and was handled

    SLAssertTrue(NO, @"have not written test yet");
}

- (void)testMultipleHandlersMayBeAddedSimultaneously {
    NSString *alert1Title = @"Alert 1";
    SLLogAsync(@"placeholder for unused alert variable %@", alert1Title);
    // add handler for first alert


    NSString *alert2Title = @"Alert 2";
    SLLogAsync(@"placeholder for unused alert variable %@", alert2Title);
    // add handler for second alert

    // now fill out info for first alert

    // now tap button to display first alert

    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // Test that first alert was handled, second was not

    // showing the second alert may be slightly delayed by the first's dismissal
    // fill out textfields with second alert info below
    
    // now tap button to show second alert

    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // now test that the second alert was handled

    SLAssertTrue(NO, @"have not written test yet");
}

@end
