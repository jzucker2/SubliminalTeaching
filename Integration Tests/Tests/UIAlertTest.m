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
    // Set subliminal elements here
    _showAlertButton = [SLButton elementWithAccessibilityLabel:@"Show alert"];
    _alertTitleTextField = [SLTextField elementWithAccessibilityIdentifier:@"alert title"];
    _alertCancelTextField = [SLTextField elementWithAccessibilityIdentifier:@"alert cancel"];
    _alertOtherTextField = [SLTextField elementWithAccessibilityIdentifier:@"alert other"];
}

- (void)tearDownTestCaseWithSelector:(SEL)testCaseSelector {
    SLAskApp(dismissActiveAlertAndClearTitleOfLastButtonClicked);

    [super tearDownTestCaseWithSelector:testCaseSelector];
}

- (void)testHandleParticularAlert {
    // first set alert handler
    SLAlert *alert = [SLAlert alertWithTitle:@"Random Alert"];
    SLAlertHandler *alertHandler = [alert dismissWithButtonTitled:@"Ok"];
    [SLAlertHandler addHandler:alertHandler];

    // Use TextField handling to fill out alert info below
    SLAssertTrue([UIAElement(_showAlertButton) isValidAndVisible], @"could not show alert button");
    SLAssertFalse([UIAElement(_showAlertButton) isEnabled], @"show alert button was not originally disabled");

    [_alertTitleTextField setText:@"Random Alert"];
    [_alertOtherTextField setText:@"Ok"];
    [_alertCancelTextField setText:@"Cancel"];

    // code to tap button to display alert below
    SLAssertTrue([UIAElement(_showAlertButton) isEnabled], @"show alert button never enabled");
    [_showAlertButton tap];

    // now wait for alert
    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // now test that alert appeared and was handled

    SLAssertTrue([alertHandler didHandleAlert], @"did not handle alert");
}

- (void)testMultipleHandlersMayBeAddedSimultaneously {
    NSString *alert1Title = @"Alert 1";
    SLLogAsync(@"placeholder for unused alert variable %@", alert1Title);
    // add handler for first alert
    SLAlert *alert1 = [SLAlert alertWithTitle:alert1Title];
    SLAlertHandler *alertHandler1 = [alert1 dismissWithButtonTitled:@"Ok"];
    [SLAlertHandler addHandler:alertHandler1];


    NSString *alert2Title = @"Alert 2";
    SLLogAsync(@"placeholder for unused alert variable %@", alert2Title);
    // add handler for second alert
    SLAlert *alert2 = [SLAlert alertWithTitle:alert2Title];
    SLAlertHandler *alertHandler2 = [alert2 dismissWithButtonTitled:@"Ok"];
    [SLAlertHandler addHandler:alertHandler2];

    // now fill out info for first alert
    [_alertTitleTextField setText:alert1Title];
    [_alertOtherTextField setText:@"Ok"];
    [_alertCancelTextField setText:@"Cancel"];

    // now tap button to display first alert
    [_showAlertButton tap];

    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // Test that first alert was handled, second was not
    SLAssertTrue([alertHandler1 didHandleAlert], @"did not handle first alert");
    SLAssertFalse([alertHandler2 didHandleAlert], @"handled second alert");

    // showing the second alert may be slightly delayed by the first's dismissal
    // fill out textfields with second alert info below
    [_alertTitleTextField setText:alert2Title];
    [_alertOtherTextField setText:@"Ok"];
    [_alertCancelTextField setText:@"Cancel"];
    // now tap button to show second alert
    [_showAlertButton tap];
    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // now test that the second alert was handled
    SLAssertTrue([alertHandler2 didHandleAlert], @"did not handle alert 2");
}

@end
