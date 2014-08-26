//
//  UIMyButton.h
//  ABCalendarPicker
//
//  Created by Anton Bukov on 25.08.12.
//  Copyright (c) 2013 Anton Bukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIMyButton : UIControl

@property (nonatomic) NSInteger numberOfDots;
@property (strong,nonatomic) UIFont * tileTitleFont;
@property (strong,nonatomic) UIFont * tileDotFont;

- (NSString *)titleForState:(UIControlState)state;
- (UIColor *)titleColorForState:(UIControlState)state;
- (UIImage *)backgroundImageForState:(UIControlState)state;

- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;

+ (NSMutableDictionary *)stateSizeImageDict;

@end
