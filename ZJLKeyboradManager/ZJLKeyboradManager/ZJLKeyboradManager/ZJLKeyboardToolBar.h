//
//  ZJLKeyboardToolBar.h
//  ZJLKeyboradManager
//
//  Created by zjl on 2024/12/26.
//

#import <Foundation/Foundation.h>
#import "ZJLKeyboardToolBarView.h"

@protocol ZJLKeyboardToolBarDelegate<NSObject>
@optional
- (void)clickFinish;
@end
NS_ASSUME_NONNULL_BEGIN

@interface ZJLKeyboardToolBar : NSObject
@property (nonatomic,strong) ZJLKeyboardToolBarView *toolBarView;

@property (nonatomic,weak) id<ZJLKeyboardToolBarDelegate> delegate;
- (void)initToolBar;
@end

NS_ASSUME_NONNULL_END
