//
//  ViewController.m
//  weiboDemo
//
//  Created by Tb on 2017/11/4.
//  Copyright © 2017年 Tb. All rights reserved.
//

#define  ATdeviceScaleWidth  [UIScreen mainScreen].bounds.size.width
#define  ATdeviceScaleHight  [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "XMGPlaceholderTextView.h"
#import "WBKeyBoardToolView.h"
#import "NSArray+Extension.h"
#import "UIView+Extension.h"

@interface ViewController ()<UITextViewDelegate>

@property (nonatomic, strong)XMGPlaceholderTextView *textView;
@property (nonatomic, strong)WBKeyBoardToolView     *toolView;

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"aaaa";
    [self setupTextView];
    [self setupToolBarView];
 
    
}

- (void)setupToolBarView
{
    NSArray *atArray = @[@"@姚晨 ", @"@陈坤 ", @"@赵薇 ", @"@Angelababy " , @"@TimCook ", @"@我的印象笔记 "];
    
     NSArray *topic = @[@"#冰雪奇缘[电影]# ", @"#Let It Go[音乐]# ", @"#纸牌屋[图书]# ", @"#北京·理想国际大厦[地点]# " , @"#腾讯控股 kh00700[股票]# ", @"#WWDC# "];
    
    
    WBKeyBoardToolView *toolView = [WBKeyBoardToolView keyBoardToolView];
    [self.view addSubview:toolView];
    self.toolView = toolView;
    self.toolView.y = ATdeviceScaleHight - toolView.height;
    
    __weak typeof(self) weakSelf = self;
    
    [self.toolView setButtonClickBlock:^(toolBarViewButtonClickType buttonClick) {
        switch (buttonClick) {
            case toolBarViewButtonClickTypePicture:
                break;
            case toolBarViewButtonClickTypeAt:
              
                [weakSelf.textView replaceRange:weakSelf.textView.selectedTextRange withText:[atArray rangdomObject]];
                break;
            case toolBarViewButtonClickTypeTopic:
                 [weakSelf.textView replaceRange:weakSelf.textView.selectedTextRange withText:[topic rangdomObject]];
                break;
            case toolBarViewButtonClickTypeEmoticon:
                if (weakSelf.textView.inputView) {
                    weakSelf.textView.inputView = nil;
                    [weakSelf.textView reloadInputViews];
                    [weakSelf becomeFirstResponder];
                    
                    [weakSelf.toolView.emoticonButton setImage:[UIImage imageNamed:@"compose_emoticonbutton_background"] forState:UIControlStateNormal];
                    [weakSelf.toolView.emoticonButton setImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] forState:UIControlStateHighlighted];
                    
                } else {
                    UIView *emotionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ATdeviceScaleWidth, 300)];
                    emotionView.backgroundColor = [UIColor redColor];
                    weakSelf.textView.inputView = emotionView;
                    
                    [weakSelf.textView reloadInputViews];
                    [weakSelf.textView becomeFirstResponder];
                    [weakSelf.toolView.emoticonButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background"] forState:UIControlStateNormal];
                    [weakSelf.toolView.emoticonButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background_highlighted"] forState:UIControlStateHighlighted];
                }
                break;
            case toolBarViewButtonClickTypeExtra:
                
                break;
            default:
                break;
        }
    }];
    
}

- (void)setupTextView
{
    XMGPlaceholderTextView *textView = [[XMGPlaceholderTextView alloc] init];
    textView.delegate = self;
    textView.frame = self.view.bounds;
    textView.placeholder = @"把好玩的图片，好笑的段子或糗事发到这里。";
    [self.view addSubview:textView];
    self.textView = textView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
- (void)KeyboardWillChangeFrameNotification:(NSNotification *)note
{
    CGFloat duration = [[note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect endRect = [[note.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:duration animations:^{
        self.toolView.transform = CGAffineTransformMakeTranslation(0, endRect.origin.y - ATdeviceScaleHight);
    }];
}

#pragma mark- Action


#pragma mark - UITextViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


@end
