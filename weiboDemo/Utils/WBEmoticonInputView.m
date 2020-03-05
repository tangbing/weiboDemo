
//
//  WBEmoticonInputView.m
//  weiboDemo
//
//  Created by Tb on 2017/11/5.
//  Copyright © 2017年 Tb. All rights reserved.
//

#define  ATdeviceScaleWidth  [UIScreen mainScreen].bounds.size.width
#define  ATdeviceScaleHight  [UIScreen mainScreen].bounds.size.height

#define kViewHeight 216
#define kToolbarHeight 37
#define kOneEmoticonHeight 50
#define kOnePageCount 20

#import "WBEmoticonInputView.h"


@implementation WBEmoticonInputView

+ (instancetype)sharedView
{
    static WBEmoticonInputView *v;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        v = [[self alloc] init];
    });
    return v;
}

- (instancetype)init
{
    if (self = [super init]) {
         self.frame = CGRectMake(0, 0, ATdeviceScaleWidth, kViewHeight);
           [self initGroups];
    }
    return self;
}

- (void)initGroups
{
    
}

@end
