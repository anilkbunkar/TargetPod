//
//  CustomTap.h
//  target1
//
//  Created by Anil Bunkar on 09/07/18.
//  Copyright © 2018 Adobe Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTap : UIGestureRecognizer
- (id)initWithTarget:(id)target action:(SEL)action;
@end
