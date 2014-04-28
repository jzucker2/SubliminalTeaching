//
//  DynamicValueTestViewController.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/28/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTestCaseViewController.h"

#import <Subliminal/SLTestController+AppHooks.h>

#import "SubclassLabel.h"

@interface DynamicValueTestViewController : SLTestCaseViewController

@end

@interface DynamicValueTestViewController ()
@property (nonatomic, weak) IBOutlet UILabel *testLabel;
@property (nonatomic, weak) IBOutlet UIButton *testButton;
@property (nonatomic, weak) IBOutlet SubclassLabel *subclassLabel;
@end

@implementation DynamicValueTestViewController

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"DynamicValueTestViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    // Test case specific configuration is best done using app hooks
    // triggered from -[DynamicValueTest setUpTestCaseWithSelector:].
    _testLabel.text = @"foo";
    _testLabel.isAccessibilityElement = YES;
    // set _testLabel identifier below to be able to pass testcase
    

    [_testButton setTitle:@"Change to Bar" forState:UIControlStateNormal];
    _testButton.isAccessibilityElement = YES;
    _testButton.accessibilityLabel = @"Change to Bar";

    _subclassLabel.text = @"foo";
}

- (instancetype)initWithTestCaseWithSelector:(SEL)testCase {
    self = [super initWithTestCaseWithSelector:testCase];
    if (self) {
        // Register for app hooks, e.g.
    }
    return self;
}

// Deregister for app hooks, if any
//- (void)dealloc {
//    [[SLTestController sharedTestController] deregisterTarget:self];
//}

#pragma mark - App hooks
// Put any app hooks below here
- (void)setTestLabelText:(NSString *)text
{
    // need to update label
    _testLabel.text = text;
}

- (IBAction)tapButton:(id)sender
{
    [self setTestLabelText:@"bar"];
    _subclassLabel.text = @"bar";
}

@end
