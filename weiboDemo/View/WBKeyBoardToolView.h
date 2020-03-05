//
//  WBKeyBoardToolView.h
//  weiboDemo
//
//  Created by Tb on 2017/11/4.
//  Copyright © 2017年 Tb. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, toolBarViewButtonClickType)
{
    toolBarViewButtonClickTypePicture,
    toolBarViewButtonClickTypeAt,
    toolBarViewButtonClickTypeTopic,
    toolBarViewButtonClickTypeEmoticon,
    toolBarViewButtonClickTypeExtra
    
};

@interface WBKeyBoardToolView : UIView
@property (weak, nonatomic) IBOutlet UIButton *emoticonButton;

@property (nonatomic, copy)void (^buttonClickBlock)(toolBarViewButtonClickType buttonClick);
+ (instancetype)keyBoardToolView;

@end
