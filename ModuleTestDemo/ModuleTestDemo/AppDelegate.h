//
//  AppDelegate.h
//  ModuleTestDemo
//
//  Created by 宗丽娜 on 17/6/23.
//  Copyright © 2017年 宗丽娜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

