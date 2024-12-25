//
//  ZJLKeyboradManager.h
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZJLKeyboradManager : NSObject
+ (instancetype)sharedInstance;

@property (nonatomic,assign) BOOL allowClickBgToHide;//是否允许点背景收起键盘 默认为YES
@property (nonatomic,assign) BOOL isShowToolBar; //是否需要键盘上面的工具条 默认为YES
@property (nonatomic,assign) BOOL isAutoScroll;//是否需要自动滚动页面来防止输入框遮挡 默认为YES
@end

NS_ASSUME_NONNULL_END