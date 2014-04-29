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

    // Do any additional setup after loading the view from its nib.
    // Test case specific configuration is best done using app hooks
    // triggered from -[SimpleTapTest setUpTestCaseWithSelector:].

    _testButton.isAccessibilityElement = YES;

    _testLabel.isAccessibilityElement = YES;
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
        // Register for app hooks, e.g.
        // [[SLTestController sharedTestController] registerTarget:<#(id)#> forAction:<#(SEL)#>];
    }
    return self;
}

- (IBAction)tapTestButton:(id)sender
{
    _testLabel.text = @"tapped";
}

// Deregister for app hooks, if any
//- (void)dealloc {
//    [[SLTestController sharedTestController] deregisterTarget:self];
//}

//#pragma mark - App hooks
// Put any app hooks below here

@end
