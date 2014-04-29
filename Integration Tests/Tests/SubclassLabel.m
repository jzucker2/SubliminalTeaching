//
//  SubclassLabel.m
//  Subliminal
//
//  Created by Jordan Zucker on 4/28/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SubclassLabel.h"

@implementation SubclassLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)isAccessibilityElement
{
    // return YES for elements and no for containers
    return YES;
}

- (NSString *)accessibilityLabel
{
    // must be implemented for test
    return nil;
}

- (NSString *)accessibilityValue
{
    // must be implemented for test
    return nil;
}

@end
