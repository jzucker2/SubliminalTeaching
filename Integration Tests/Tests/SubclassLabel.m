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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)isAccessibilityElement
{
    // return YES for elements and no for containers
    return YES;
}

- (NSString *)accessibilityLabel
{
    // must be implemented for class
    return nil;
}

- (NSString *)accessibilityValue
{
    // must be implemented for class
    return nil;
}

@end
