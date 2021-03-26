//
//  AppDelegate.h
//  NotifyDemo
//
//  Created by gaolailong on 2021/3/26.
//

#import <UIKit/UIKit.h>
#define DDLOG(...) printf("%s\n",[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

