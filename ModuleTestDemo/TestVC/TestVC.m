//
//  TestVC.m
//  TestMain
//
//  Created by 宗丽娜 on 17/6/23.
//  Copyright © 2017年 宗丽娜. All rights reserved.
//

#import "TestVC.h"
#import "TestVC2.h"
@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 666;
    self.view.backgroundColor = [UIColor redColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
NSLog(@"摸到我了");
 static BOOL isPlay = NO;
      isPlay = !isPlay;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlay)];
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
    //
    [self.navigationController pushViewController:[TestVC2 new] animated:YES];
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
