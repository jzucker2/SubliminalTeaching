//
//  SimpleTapTestViewController.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/29/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTestCaseViewController.h"

#import <Subliminal/SLTestController+AppHooks.h>

@interface SimpleTapTestViewController : SLTestCaseViewController
- (IBAction)tapTestButton:(id)sender;
@end

@interface SimpleTapTestViewController ()
@property (nonatomic, weak) IBOutlet UIButton *testButton;
@property (nonatomic, weak) IBOutlet UILabel *testLabel;
@end

@implementation SimpleTapTestViewController

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"SimpleTapTestViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _testButton.isAccessibilityElement = YES;
    [_testButton setTitle:@"test button" forState:UIControlStateNormal];

    _testLabel.isAccessibilityElement = YES;
    _testLabel.text = @"untapped";
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
    }
    return self;
}

- (IBAction)tapTestButton:(id)sender
{
    _testLabel.text = @"tapped";
}

@end
