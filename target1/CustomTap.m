//
//  CustomTap.m
//  target1
//
//  Created by Anil Bunkar on 09/07/18.
//  Copyright © 2018 Adobe Systems. All rights reserved.
//

#import "CustomTap.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation CustomTap

-(id)initWithTarget:(id)target action:(SEL)action
{
    self = [super initWithTarget:target action:action];
    return self;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (touches.count > 1) {
        self.state = UIGestureRecognizerStateFailed;
    } else if (self.state == UIGestureRecognizerStatePossible){
        self.state = UIGestureRecognizerStateBegan;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
//    if ([self isKindOfClass:[UITapGestureRecognizer class]]) {
//        self.state = UIGestureRecognizerStateRecognized;
//    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
//    self.state = UIGestureRecognizerStateCancelled;
//    [self reset];
}

- (void) reset {
    [super reset];
//    self.state = UIGestureRecognizerStatePossible;
}
@end
