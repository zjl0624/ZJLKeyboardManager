//
//  ViewController.m
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/25.
//

#import "ViewController.h"
#import "ZJLKeyboradManager.h"

@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UITextField *anotherTextField;

@property (nonatomic,strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 500, [UIScreen mainScreen].bounds.size.width - 50 * 2, 60)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    _anotherTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, [UIScreen mainScreen].bounds.size.width - 50 * 2, 60)];
    _anotherTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_anotherTextField];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 50 * 2, 60)];
    _textView.layer.borderWidth = 1;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:_textView];
    
    [ZJLKeyboradManager sharedInstance].isEnabled = YES;;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [ZJLKeyboradManager sharedInstance].allowClickBgToHide = NO;
//    [ZJLKeyboradManager sharedInstance].isAutoScroll = NO;
}
@end
