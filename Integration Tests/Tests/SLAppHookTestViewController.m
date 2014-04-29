//
//  SLAppHookTestViewController.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/28/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTestCaseViewController.h"

#import <Subliminal/SLTestController+AppHooks.h>

@interface SLAppHookTestViewController : SLTestCaseViewController

@end

@interface SLAppHookTestViewController ()
@property (nonatomic, weak) IBOutlet UIView *testView;
@property (nonatomic, weak) IBOutlet UIButton *testButton;
@property (nonatomic, weak) IBOutlet UILabel *testLabel;
@end

@implementation SLAppHookTestViewController

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"SLAppHookTestViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    // Test case specific configuration is best done using app hooks
    // triggered from -[SLAppHookTest setUpTestCaseWithSelector:].
    _testLabel.text = @"foo";
    _testLabel.isAccessibilityElement = YES;
    
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
        // Register for app hooks, e.g.
        [[SLTestController sharedTestController] registerTarget:self forAction:@selector(setLabel)];
    }
    return self;
}

// Deregister for app hooks, if any
- (void)dealloc {
    [[SLTestController sharedTestController] deregisterTarget:self];
}

#pragma mark - App hooks
// Put any app hooks below here
- (void)setLabel
{
    _testLabel.text = @"bar";
}

@end
