//
//  ABCalendarPickerDefaultStyleProvider.m
//  ABCalendarPicker
//
//  Created by Anton Bukov on 01.07.12.
//  Copyright (c) 2013 Anton Bukov. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ABViewPool.h"
#import "ABCalendarPickerDefaultStyleProvider.h"
#import "UIMyButton.h"

@interface ABCalendarPickerDefaultStyleProvider()
@property (strong,nonatomic) ABViewPool * controlsPool;
@end

@implementation ABCalendarPickerDefaultStyleProvider

@synthesize maxNumberOfDots = _maxNumberOfDots;
@synthesize controlsPool = _controlsPool;

@synthesize textColor = _textColor;
@synthesize patternImageForGradientBar = _patternImageForGradientBar;

@synthesize columnFont = _columnFont;
@synthesize tileTitleFont = _tileTitleFont;
@synthesize tileDotFont = _tileDotFont;

@synthesize highlightedImage = _highlightedImage;
@synthesize selectedHighlightedImage = _selectedHighlightedImage;

@synthesize normalTextColor = _normalTextColor;
@synthesize disabledTextColor = _disabledTextColor;
@synthesize selectedTextColor = _selectedTextColor;

@synthesize backgroundColor = _backgroundColor;

- (NSBundle *)frameworkBundle
{
    static NSBundle* frameworkBundle = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        NSString* mainBundlePath = [[NSBundle mainBundle] resourcePath];
        NSString* frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"ABCalendarPicker.bundle"];
        frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    });
    return frameworkBundle;
}

- (UIImage *)imageNamed:(NSString*)name
{
    if ([self frameworkBundle])
        return [UIImage imageWithContentsOfFile:[[self frameworkBundle] pathForResource:name ofType:@"png"]];
    else
        return [UIImage imageNamed:name];
}

- (ABViewPool *)controlsPool
{
    if (_controlsPool == nil)
        _controlsPool = [[ABViewPool alloc] init];
    return _controlsPool;
}

- (UIColor *)textColor
{
    return [self normalTextColor];
}

- (void)setTextColor:(UIColor *)textColor
{
    [self setNormalTextColor:textColor];
}

- (UIFont *)titleFontForColumnTitlesVisible
{
    if (_titleFontForColumnTitlesVisible == nil)
        _titleFontForColumnTitlesVisible = [UIFont boldSystemFontOfSize:23.0f];
    return _titleFontForColumnTitlesVisible;
}

- (UIFont *)titleFontForColumnTitlesInvisible
{
    if (_titleFontForColumnTitlesInvisible == nil)
        _titleFontForColumnTitlesInvisible = [UIFont boldSystemFontOfSize:28.0f];
    return _titleFontForColumnTitlesInvisible;
}

- (UIFont *)columnFont
{
    if (_columnFont == nil)
        _columnFont = [UIFont boldSystemFontOfSize:10.0f];
    return _columnFont;
}

- (UIFont *)tileTitleFont
{
    if (_tileTitleFont == nil)
        _tileTitleFont = [UIFont boldSystemFontOfSize:24.0];
    return _tileTitleFont;
}

- (UIFont *)tileDotFont
{
    if (_tileDotFont == nil)
        _tileDotFont = [UIFont boldSystemFontOfSize:20.0];
    return _tileDotFont;
}

- (UIImage *)patternImageForGradientBar
{
    if (_patternImageForGradientBar == nil)
        _patternImageForGradientBar = [self imageNamed:@"GradientBar"];
    return _patternImageForGradientBar;
}

- (UIImage*)highlightedImage
{
    if (_highlightedImage == nil)
        _highlightedImage = [[self imageNamed:@"TileSelected"] resizableImageWithCapInsets:UIEdgeInsetsMake(2,1,2,1)];
    return _highlightedImage;
}

- (void)setHighlightedImage:(UIImage *)image
{
    _highlightedImage = image;
    [self.controlsPool clear];
    [[UIMyButton stateSizeImageDict] removeAllObjects];
}

- (UIImage*)selectedHighlightedImage
{
    if (_selectedHighlightedImage == nil)
        _selectedHighlightedImage = [[self imageNamed:@"TileTodaySelected"] resizableImageWithCapInsets:UIEdgeInsetsMake(11,9,11,9)];
    return _selectedHighlightedImage;
}

- (void)setSelectedHighlightedImage:(UIImage *)image
{
    _selectedHighlightedImage = image;
    [self.controlsPool clear];
    [[UIMyButton stateSizeImageDict] removeAllObjects];
}

- (UIColor *)normalTextColor
{
    if (_normalTextColor == nil)
        _normalTextColor = [UIColor darkGrayColor];
    return _normalTextColor;
}

- (void)setNormalTextColor:(UIColor *)color
{
    _normalTextColor = color;
    [self.controlsPool clear];
    [[UIMyButton stateSizeImageDict] removeAllObjects];
}

- (UIColor *)disabledTextColor
{
    if (_disabledTextColor == nil)
        _disabledTextColor = [UIColor grayColor];
    return _disabledTextColor;
}

- (void)setDisabledTextColor:(UIColor *)color
{
    _disabledTextColor = color;
    [self.controlsPool clear];
    [[UIMyButton stateSizeImageDict] removeAllObjects];
}

- (UIColor *)selectedTextColor
{
    if (_selectedTextColor == nil)
        _selectedTextColor = [UIColor whiteColor];
    return _selectedTextColor;
}

- (void)setSelectedTextColor:(UIColor *)color
{
    _selectedTextColor = color;
    [self.controlsPool clear];
    [[UIMyButton stateSizeImageDict] removeAllObjects];
}

- (UIColor *)backgroundColor
{
    if (_backgroundColor == nil)
        _backgroundColor = [UIColor whiteColor];
    return _backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)color
{
    _backgroundColor = color;
    [self.controlsPool clear];
    [[UIMyButton stateSizeImageDict] removeAllObjects];
}

- (UIControl*)calendarPicker:(ABCalendarPicker*)calendarPicker
            cellViewForTitle:(NSString*)cellTitle
                    andState:(ABCalendarPickerState)state
{
    UIMyButton * button = (UIMyButton *)[self.controlsPool giveExistingOrCreateNewWith:^
    {
        UIMyButton * button = [[UIMyButton alloc] init];
        button.tileTitleFont = self.tileTitleFont;
        button.tileDotFont = self.tileDotFont;
        button.opaque = YES;
        button.userInteractionEnabled = NO;
        button.clipsToBounds = YES;
        
        [button setTitleColor:self.normalTextColor forState:UIControlStateNormal];
        [button setTitleColor:self.disabledTextColor forState:UIControlStateDisabled];
        [button setTitleColor:self.selectedTextColor forState:UIControlStateDisabled | UIControlStateSelected];
        [button setTitleColor:self.selectedTextColor forState:UIControlStateHighlighted];
        [button setTitleColor:self.normalTextColor forState:UIControlStateSelected];
        [button setTitleColor:self.selectedTextColor forState:UIControlStateSelected | UIControlStateHighlighted];
        
        [button setBackgroundImage:self.highlightedImage forState:UIControlStateHighlighted];
        [button setBackgroundImage:self.selectedHighlightedImage forState:UIControlStateSelected | UIControlStateHighlighted];
        
        [button setBackgroundColor:self.backgroundColor];
        
        return button;
    }];
    
    button.numberOfDots = 0;
    [button setTitle:cellTitle forState:UIControlStateNormal];
    return button;
}

- (void)calendarPicker:(ABCalendarPicker*)calendarPicker
 postUpdateForCellView:(UIControl*)control
        onControlState:(UIControlState)controlState
            withEvents:(NSInteger)eventsCount
              andState:(ABCalendarPickerState)state
{
    if (state != ABCalendarPickerStateDays
        && state != ABCalendarPickerStateWeekdays)
        return;
    
    UIMyButton * button = (UIMyButton *)control;
    button.numberOfDots = MIN(self.maxNumberOfDots,eventsCount);
}

- (id)init
{
    if (self = [super init])
    {
        self.maxNumberOfDots = 6;
    }
    return self;
}

@end
