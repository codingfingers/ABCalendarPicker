//
//  ABCalendarPickerDefaultStyleProvider.h
//  ABCalendarPicker
//
//  Created by Anton Bukov on 01.07.12.
//  Copyright (c) 2013 Anton Bukov. All rights reserved.
//

#import "ABCalendarPicker.h"
#import "ABCalendarPickerStyleProviderProtocol.h"
#import <Foundation/Foundation.h>

@interface ABCalendarPickerDefaultStyleProvider : NSObject<ABCalendarPickerStyleProviderProtocol>

@property (strong,nonatomic) UIColor * textColor;
@property (strong,nonatomic) UIImage * patternImageForGradientBar;

@property (strong,nonatomic) UIFont * titleFontForColumnTitlesVisible;
@property (strong,nonatomic) UIFont * titleFontForColumnTitlesInvisible;
@property (strong,nonatomic) UIFont * columnFont;
@property (strong,nonatomic) UIFont * tileTitleFont;
@property (strong,nonatomic) UIFont * tileDotFont;

@property (strong,nonatomic) UIColor * backgroundColor;

- (UIControl*)calendarPicker:(ABCalendarPicker*)calendarPicker
            cellViewForTitle:(NSString*)cellTitle
                    andState:(ABCalendarPickerState)state;

- (void)calendarPicker:(ABCalendarPicker*)calendarPicker
 postUpdateForCellView:(UIControl*)control
        onControlState:(UIControlState)controlState
            withEvents:(NSInteger)eventsCount
              andState:(ABCalendarPickerState)state;

@property (strong,nonatomic) UIImage * highlightedImage;
@property (strong,nonatomic) UIImage * selectedHighlightedImage;

@property (strong,nonatomic) UIColor * normalTextColor;
@property (strong,nonatomic) UIColor * disabledTextColor;
@property (strong,nonatomic) UIColor * selectedTextColor;

@property (assign,nonatomic) NSInteger maxNumberOfDots;

@end
