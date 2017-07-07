//
//  LNTestTabBar.h
//  TestMain
//
//  Created by 宗丽娜 on 17/6/23.
//  Copyright © 2017年 宗丽娜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNTestTabBar : UITabBar
/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);
@end
