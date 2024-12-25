//
//  ZJLKeyboradManager.m
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/25.
//

#import "ZJLKeyboradManager.h"
static id _instance;
@interface ZJLKeyboradManager ()
@property (nonatomic,strong) UITapGestureRecognizer *tapBg;
@property (nonatomic,strong) UIView *textFieldView;
@property (nonatomic,assign) CGFloat keyboardHeight;
@property (nonatomic,assign) CGFloat keyboardShowDuration;

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
}

- (void)setIsEnabled:(BOOL)isEnabled {
    _isEnabled = isEnabled;
    if (_isEnabled == YES) {
        [self registerKeyboardNotification];
    }else {
        [self unRegisterKeyboardNotification];
    }
}


- (void)registerKeyboardNotification {
    // 添加通知监听见键盘弹出/退出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
}

- (void)unRegisterKeyboardNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardAction:(NSNotification*)sender {
    NSDictionary *useInfo = [sender userInfo];
    NSValue *value = [useInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    _keyboardHeight = [value CGRectValue].size.height;
    _keyboardShowDuration = [[useInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    // <注意>具有约束的控件通过改变约束值进行frame的改变处理
    if([sender.name isEqualToString:UIKeyboardWillShowNotification]){
        [self autoScrollWindow];
        if (_allowClickBgToHide == YES) {
            _tapBg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBg:)];
            [[UIApplication sharedApplication].delegate.window addGestureRecognizer:_tapBg];
        }

    }else{
        if (_isAutoScroll == YES) {
            [UIApplication sharedApplication].delegate.window.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        }

        [[UIApplication sharedApplication].delegate.window removeGestureRecognizer:_tapBg];
    }
}

- (void)clickBg:(UITapGestureRecognizer *)gesture {
    CGPoint p = [gesture locationInView:_textFieldView];
    if ([_textFieldView.layer containsPoint:p] == YES) {
        return;
    }
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        //Resigning currently responder textField.
        [self resignFirstResponder];
    }
}

- (void)resignFirstResponder {
    if ([_textFieldView isKindOfClass:[UITextField class]] || [_textFieldView isKindOfClass:[UITextView class]]) {
        [((UITextField *)_textFieldView) resignFirstResponder];
    }
}

- (void)textFieldDidBeginEditing:(NSNotification *)sender {
    _textFieldView = sender.object;
    [self autoScrollWindow];
}

- (void)textFieldDidEndEditing:(NSNotification *)sender  {
    _textFieldView = nil;
}

- (void)textViewDidBeginEditing:(NSNotification *)sender {
    _textFieldView = sender.object;
    [self autoScrollWindow];
}

- (void)textViewDidEndEditing:(NSNotification *)sender {
    _textFieldView = nil;
    
}

- (void)autoScrollWindow{
    if (_isAutoScroll == YES && _keyboardHeight > 0 && _textFieldView != nil) {
        [UIView animateWithDuration:_keyboardShowDuration animations:^{
            [UIApplication sharedApplication].delegate.window.bounds = CGRectMake(0, [self caculatorScrollDistance:_keyboardHeight], [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        }];

        

    }
}

- (CGFloat)caculatorScrollDistance:(CGFloat)keyboardHeight {
    CGRect textFieldViewRect = [[UIApplication sharedApplication].delegate.window convertRect:_textFieldView.frame toView:nil];
    CGFloat textFieldViewToBottom = [UIScreen mainScreen].bounds.size.height - textFieldViewRect.origin.y - textFieldViewRect.size.height;
    if (textFieldViewToBottom > keyboardHeight) {
        return 0;
    }else {
        return keyboardHeight - textFieldViewToBottom;
    }
}
@end
