//
//  SLDeviceTestViewController.m
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

#import "SLTestCaseViewController.h"

#import <Subliminal/SLTestController+AppHooks.h>

@interface SLDeviceTestViewController : SLTestCaseViewController

@end

@interface SLDeviceTestViewController ()
@property (nonatomic, weak) IBOutlet UILabel *backgroundLabel;
@end

@implementation SLDeviceTestViewController

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"SLDeviceTestViewController";
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateDeactivatedLabelText) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[SLTestController sharedTestController] deregisterTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _backgroundLabel.isAccessibilityElement = YES;
    _backgroundLabel.accessibilityIdentifier = @"deactivatedLabel";
}

- (void)updateDeactivatedLabelText
{
    _backgroundLabel.text = @"did background";
}



@end
