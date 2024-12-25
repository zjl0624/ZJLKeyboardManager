//
//  ZJLKeyboradManager.m
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/25.
//

#import "ZJLKeyboradManager.h"
static id _instance;
@interface ZJLKeyboradManager ()

@end
@implementation ZJLKeyboradManager
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        [_instance initConfigure];
    });
    return _instance;
}

- (void)initConfigure {
    _allowClickBgToHide = YES;
    _isShowToolBar = YES;
    _isAutoScroll = YES;
    [self registerKeyboardNotification];
}


- (void)registerKeyboardNotification {
    // 添加通知监听见键盘弹出/退出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardAction:(NSNotification*)sender {
    NSDictionary *useInfo = [sender userInfo];
    NSValue *value = [useInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    // <注意>具有约束的控件通过改变约束值进行frame的改变处理
    if([sender.name isEqualToString:UIKeyboardWillShowNotification]){
        KeyWindow.bounds = CGRectMake(0, [value CGRectValue].size.height, kScreenWidth, kScreenHeight);
    }else{
        KeyWindow.bounds = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    }
}
@end
