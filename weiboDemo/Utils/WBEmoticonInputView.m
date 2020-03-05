
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

<<<<<<< HEAD
=======
@interface

>>>>>>> 552e11d7bab9c2133dbd1fee4a6ae410e844dd08

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
<<<<<<< HEAD
    if (self = [super init]) {
         self.frame = CGRectMake(0, 0, ATdeviceScaleWidth, kViewHeight);
           [self initGroups];
    }
    return self;
}

=======
    self = [super init];
    self.frame = CGRectMake(0, 0, ATdeviceScaleWidth, kViewHeight);
    [self initGroups];
    
}
>>>>>>> 552e11d7bab9c2133dbd1fee4a6ae410e844dd08
- (void)initGroups
{
    
}

@end
