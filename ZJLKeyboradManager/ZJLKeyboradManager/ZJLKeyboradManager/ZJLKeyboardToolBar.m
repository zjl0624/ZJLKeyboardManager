//
//  ZJLKeyboardToolBar.m
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/26.
//

#import "ZJLKeyboardToolBar.h"
@interface ZJLKeyboardToolBar()
@end
@implementation ZJLKeyboardToolBar
- (void)initToolBar {
    _toolBarView = [[ZJLKeyboardToolBarView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    _toolBarView.hidden = YES;
    __weak __typeof(&*self)weakSelf = self;
    _toolBarView.clickFinishBlock = ^{
        if ([weakSelf.delegate respondsToSelector:@selector(clickFinish)]) {
            [weakSelf.delegate clickFinish];
        }
    };
}
@end
