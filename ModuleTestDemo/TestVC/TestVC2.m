//
//  TestVC2.m
//  TestMain
//
//  Created by 宗丽娜 on 17/6/23.
//  Copyright © 2017年 宗丽娜. All rights reserved.
//

#import "TestVC2.h"

@interface TestVC2 ()

@end

@implementation TestVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 666;
    self.view.backgroundColor = [UIColor brownColor];
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
