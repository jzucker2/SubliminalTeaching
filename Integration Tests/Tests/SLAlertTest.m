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

    // --some random alert will be automatically dismissed with the cancel butotn
    SLAskApp1(showAlertWithInfo:, (@{   @"title":   @"Random Alert",
                                        @"cancel":  cancelButtonTitle,
                                        @"other":   defaultButtonTitle }));
}

- (void)testMultipleHandlersMayBeAddedSimultaneously {
    NSString *alert1Title = @"Alert 1";


    NSString *alert2Title = @"Alert 2";


    SLAskApp1(showAlertWithTitle:, alert1Title);
    // Test that first alert was handled, second was not

    // showing the second alert may be slightly delayed by the first's dismissal
    SLAskApp1(showAlertWithTitle:, alert2Title);
    // now test that the second alert was handled
}

@end
