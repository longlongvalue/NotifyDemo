//
//  AppDelegate.m
//  NotifyDemo
//
//  Created by gaolailong on 2021/3/24.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "NotificationHandle.h"

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *tabbarController = [storyboard instantiateInitialViewController];
    //设置控制器为Window的根控制器
    self.window.rootViewController = tabbarController;
    
    [self.window makeKeyAndVisible];
    
    [UNUserNotificationCenter currentNotificationCenter].delegate = [NotificationHandle shareInstance];
    
    [[NotificationHandle shareInstance] authorizationPushNotificaton:application];
    [[NotificationHandle shareInstance] registerNotificationCategory];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    NSString *tokenString = [self hexStringWithData:deviceToken]; //[[NSString alloc]initWithData:newDeviceToken encoding:NSUTF8StringEncoding];
    NSLog(@"%@", tokenString);
    
    //存储得到的token，后面备用
    [[NSUserDefaults standardUserDefaults] setValue:tokenString forKey:@"deviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"获取token失败:%@\n",error.localizedDescription);
}


- (NSString *)hexStringWithData:(NSData *)data {
    Byte *bytes = (Byte *)[data bytes];
    NSString *hexStr=@"";
    for(int i=0;i<[data length];i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1){
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        } else {
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        }
    }
    return hexStr;
}
@end
