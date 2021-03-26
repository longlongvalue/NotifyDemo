//
//  NotificationViewController.m
//  NotifyContentTest
//
//  Created by gaolailong on 2021/3/26.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationViewController () <UNNotificationContentExtension>

@property IBOutlet UILabel *label;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.label.text = @"快看";
}

- (IBAction)btnClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.label.text = @"好像成功了！";
    }else {
        self.label.text = @"快看";
    }
}


@end
