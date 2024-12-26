//
//  ZJLKeyboardToolBarView.h
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/26.
//

#import <UIKit/UIKit.h>
typedef void(^ClickZJLKeyboardToolBarViewFinishBtnBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ZJLKeyboardToolBarView : UIView
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,assign) CGFloat toolbarHeight;
@property (nonatomic,strong) ClickZJLKeyboardToolBarViewFinishBtnBlock clickFinishBlock;
@end

NS_ASSUME_NONNULL_END
