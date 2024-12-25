//
//  ViewController.m
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/25.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 500, [UIScreen mainScreen].bounds.size.width - 50 * 2, 60)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
}


@end
