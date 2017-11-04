
//
//  NSArray+Extension.m
//  weiboDemo
//
//  Created by Tb on 2017/11/4.
//  Copyright © 2017年 Tb. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)


- (NSString *)rangdomObject
{
    if (self.count) {
       return self[arc4random_uniform((u_int32_t)self.count)];
    } else {
        return nil;
    }
}
@end
