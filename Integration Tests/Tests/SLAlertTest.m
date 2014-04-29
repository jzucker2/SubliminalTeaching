//
//  SLAlertTest.m
//  Subliminal
//
//  For details and documentation:
//  http://github.com/inkling/Subliminal
//
//  Copyright 2013-2014 Inkling Systems, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "SLIntegrationTest.h"


@interface SLAlertTest : SLIntegrationTest

@end

@implementation SLAlertTest {
    BOOL _defaultAutomaticallyDismissAlerts;
}

+ (NSString *)testCaseViewControllerClassName {
    return @"SLAlertTestViewController";
}

- (void)tearDownTestCaseWithSelector:(SEL)testCaseSelector {
    SLAskApp(dismissActiveAlertAndClearTitleOfLastButtonClicked);

    [super tearDownTestCaseWithSelector:testCaseSelector];
}

#pragma mark - Manual dismissal

- (void)testHandleParticularAlert {
    NSString *cancelButtonTitle = @"Cancel";
    NSString *defaultButtonTitle = @"Ok";

    SLAlert *alert = [SLAlert alertWithTitle:@"Random Alert"];
    SLAlertHandler *alertHandler = [alert dismissWithButtonTitled:@"Ok"];
    [SLAlertHandler addHandler:alertHandler];

    // --some random alert will be automatically dismissed with the cancel butotn
    SLAskApp1(showAlertWithInfo:, (@{   @"title":   @"Random Alert",
                                        @"cancel":  cancelButtonTitle,
                                        @"other":   defaultButtonTitle }));
    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // fill out rest of test here
    SLAssertTrue([alertHandler didHandleAlert], @"did not handle alert");
}

- (void)testMultipleHandlersMayBeAddedSimultaneously {
    NSString *alert1Title = @"Alert 1";
    SLAlert *alert1 = [SLAlert alertWithTitle:alert1Title];
    SLAlertHandler *alertHandler1 = [alert1 dismiss];
    [SLAlertHandler addHandler:alertHandler1];

    NSString *alert2Title = @"Alert 2";
    SLAlert *alert2 = [SLAlert alertWithTitle:alert2Title];
    SLAlertHandler *alertHandler2 = [alert2 dismiss];
    [SLAlertHandler addHandler:alertHandler2];


    SLAskApp1(showAlertWithTitle:, alert1Title);
    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // Test that first alert was handled, second was not
    SLAssertTrue([alertHandler1 didHandleAlert], @"did not handle first alert");
    SLAssertFalse([alertHandler2 didHandleAlert], @"handled second alert");
    // showing the second alert may be slightly delayed by the first's dismissal
    SLAskApp1(showAlertWithTitle:, alert2Title);
    [self wait:SLAlertHandlerDidHandleAlertDelay];
    // now test that the second alert was handled
    SLAssertTrue([alertHandler2 didHandleAlert], @"did not handle alert 2");
}

@end
