//
//  ZJLKeyboardToolBarView.m
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/26.
//

#import "ZJLKeyboardToolBarView.h"
@interface ZJLKeyboardToolBarView()
{
    CGFloat _toolbarHeight;
}
@property (nonatomic,strong) UIView *mainView;
@property (nonatomic,strong) UILabel *finishLabel;
@property (nonatomic,strong) UIImageView *finishImageView;

@end
@implementation ZJLKeyboardToolBarView

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _mainView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_mainView];
        
        _finishLabel = [[UILabel alloc] init];
        _finishLabel.textColor = [UIColor blackColor];
        _finishLabel.font = [UIFont systemFontOfSize:16];
        _finishLabel.userInteractionEnabled = YES;
        [_mainView addSubview:_finishLabel];
        UITapGestureRecognizer *tapFinishLabel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFinishLabel)];
        [_finishLabel addGestureRecognizer:tapFinishLabel];
        
        _finishImageView = [[UIImageView alloc] init];
        _finishImageView.userInteractionEnabled = YES;
        _finishImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_mainView addSubview:_finishImageView];
        
        UITapGestureRecognizer *tapFinishImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFinishImageView)];
        [_finishImageView addGestureRecognizer:tapFinishImageView];
    }
    return self;
}
- (void)tapFinishLabel {
    if (self.clickFinishBlock) {
        self.clickFinishBlock();
    }
}

- (void)tapFinishImageView {
    if (self.clickFinishBlock) {
        self.clickFinishBlock();
    }
}

- (void)setContent:(NSString *)content {
    _content = content;
    _finishLabel.text = content;
    _finishLabel.hidden = NO;
    _finishImageView.hidden = YES;
    [_finishLabel sizeToFit];
    _finishLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 15 - CGRectGetWidth(_finishLabel.frame), 44/2 - CGRectGetHeight(_finishLabel.frame)/2, CGRectGetWidth(_finishLabel.frame), CGRectGetHeight(_finishLabel.frame));
}

- (CGFloat)toolbarHeight {
    if (_toolbarHeight == 0) {
        return 44;
    }
    return _toolbarHeight;
}


- (void)setToolbarHeight:(CGFloat)toolbarHeight {
    _toolbarHeight = toolbarHeight;
}

@end
