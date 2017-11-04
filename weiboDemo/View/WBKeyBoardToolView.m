
//
//  WBKeyBoardToolView.m
//  weiboDemo
//
//  Created by Tb on 2017/11/4.
//  Copyright © 2017年 Tb. All rights reserved.
//

#import "WBKeyBoardToolView.h"

@implementation WBKeyBoardToolView

+ (instancetype)keyBoardToolView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
- (IBAction)picture:(id)sender {
    !self.buttonClickBlock? : self.buttonClickBlock(toolBarViewButtonClickTypePicture);
}
- (IBAction)at:(id)sender {
    !self.buttonClickBlock? : self.buttonClickBlock(toolBarViewButtonClickTypeAt);
}

- (IBAction)topic:(id)sender {
    !self.buttonClickBlock? : self.buttonClickBlock(toolBarViewButtonClickTypeTopic);

}

- (IBAction)emoticon:(id)sender {
    !self.buttonClickBlock? : self.buttonClickBlock(toolBarViewButtonClickTypeEmoticon);

}

- (IBAction)extra:(id)sender {
    !self.buttonClickBlock? : self.buttonClickBlock(toolBarViewButtonClickTypeExtra);

}

@end
