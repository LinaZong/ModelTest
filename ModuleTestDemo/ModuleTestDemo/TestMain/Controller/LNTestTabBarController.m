//
//  LNTestTabBarController.m
//  TestMain
//
//  Created by 宗丽娜 on 17/6/23.
//  Copyright © 2017年 宗丽娜. All rights reserved.
//

#import "LNTestTabBarController.h"
#import "LNTestMiddleView.h"
#import "LNTestTabBar.h"
#import "LNTestNavigationController.h"
#import "UIImage+XMGImage.h"

@interface LNTestTabBarController ()

@end

@implementation LNTestTabBarController


+(instancetype)shareInstance{
   static LNTestTabBarController *tabbarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tabbarC = [[LNTestTabBarController alloc] init];
        
        
    });


    return tabbarC;

}

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(LNTestTabBarController *tabBarC))addVCBlock {
    
    LNTestTabBarController *tabbarVC = [[LNTestTabBarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    
    return tabbarVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置tabbar
    [self setUpTabbar];
}

- (void)setUpTabbar {
    [self setValue:[[LNTestTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        LNTestNavigationController *nav = [[LNTestNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
    
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex{


    [super setSelectedIndex:selectedIndex];
    
    NSLog(@"调用了%ld",selectedIndex);
    
    UIViewController *vc = self.childViewControllers[selectedIndex];
    if (vc.view.tag == 666) {
        vc.view.tag = 888;
        
        LNTestMiddleView *middleView = [LNTestMiddleView middleView];
        middleView.middleClickBlock = [LNTestMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [LNTestMiddleView shareInstance].isPlaying;
        middleView.middleImg = [LNTestMiddleView shareInstance].middleImg;
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [vc.view addSubview:middleView];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
