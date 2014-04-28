//
//  SLDeviceTest.m
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
#import <OCMock/OCMock.h>

@interface focus_SLDeviceTest : SLIntegrationTest

@end

@implementation focus_SLDeviceTest

+ (NSString *)testCaseViewControllerClassName {
    return @"SLDeviceTestViewController";
}

- (void)tearDownTestCaseWithSelector:(SEL)testCaseSelector {
    if (testCaseSelector == @selector(testCanRotateDevice)) {
        [[SLDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }
    [super tearDownTestCaseWithSelector:testCaseSelector];
}

- (void)testUseDeactivateAppForDuration {
    // Label will update after app becomes active
    SLAssertTrue(NO, @"have not written test yet");
}

- (void)testCanRotateDevice
{
    SLAssertTrue(NO, @"have not written test yet");
}

NSString * SLNSStringFromUIDeviceOrientation(UIDeviceOrientation orientation) {
	switch (orientation) {
		case UIDeviceOrientationFaceDown:           return @"UIDeviceOrientationFaceDown";              break;
		case UIDeviceOrientationFaceUp:             return @"UIDeviceOrientationFaceUp";                break;
		case UIDeviceOrientationLandscapeLeft:      return @"UIDeviceOrientationLandscapeLeft";         break;
		case UIDeviceOrientationLandscapeRight:     return @"UIDeviceOrientationLandscapeRight";        break;
		case UIDeviceOrientationPortrait:           return @"UIDeviceOrientationPortrait";              break;
		case UIDeviceOrientationPortraitUpsideDown: return @"UIDeviceOrientationPortraitUpsideDown";    break;
		case UIDeviceOrientationUnknown:            return @"UIDeviceOrientationUnknown";               break;
	}
}

@end
