//
//  ViewController.m
//  MytestApp
//
//  Created by Mr.Li on 16/1/12.
//  Copyright © 2016年 Mr.Li. All rights reserved.
//

#import "ViewController.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "CustomIOSAlertView.h"
#import "CustomAlertView.h"
#import "LMAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self getCurrentTime];
    
//    NSDictionary *dic = @{@"name":@"张三的歌",@"age":@"24",@"height":@"178",@"weight":@"75"};
//    
//    NSLog(@"dic is %@",dic);
//    
//    for (NSString *str in dic) {
//        
//        NSLog(@"key is %@",str);
//        NSLog(@"value is %@",[dic objectForKey:str]);
//    }
//    
//    
//    //h获取Mac地址和SSID
//    [self getSSIDgetMACIP];
    
    //三种 自定义alertView
    UIButton *alert = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    alert.backgroundColor = [UIColor clearColor];
    [alert setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [alert setTitle:@"弹出提示框" forState:UIControlStateNormal];
    
    [alert addTarget:self action:@selector(customDialog) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:alert];
    
    
    
    
}
#pragma mark 三种 自定义alertView
- (void)customDialog
{
     /**第一种
      CustomIOSAlertView
      **/
//    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
//    
//    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消", @"确定", nil]];
//
//    //creat and add customView
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
//    customView.backgroundColor = [UIColor redColor];
//    
//    [alertView setContainerView:customView];
//    
//    //show dialog
//    [alertView setUseMotionEffects:true];
//
//    [alertView show];
    
    
    /*第二种
    CustomAlertView
     */
//    CustomAlertView *alertView = [[CustomAlertView alloc] initWithTitle:@"我是中央情报局天气预报的提示" message:@"new world!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//    //addCustomerView
//    [alertView addCustomerSubview:[self customSubView]];
//    [alertView show];
    
    /*第三种
     LMAlertView
     */
    
    LMAlertView *alertView = [[LMAlertView alloc] initWithTitle:@"iOSDevTip"
                                                        message:@"关注一下"
                                                       delegate:nil
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil];
    
    // Add your subviews here to customise
    UIView *contentView = alertView.contentView;
    
    [alertView show];
    
    
    
}

- (UIView *)customSubView
{
    
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    myView.backgroundColor = [UIColor purpleColor];
    
    return myView;
    
    
}
// - 代理方法
-(void)alertView:(CustomAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"title is %@ ******** index is %ld",alertView.title,buttonIndex);
    
}
-(void)alertViewClosed:(CustomAlertView *)alertView
{

}

-(void)willPresentCustomAlertView:(UIView *)alertView
{

}
- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"test" object:nil];

}
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //通知注册
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:@"test" object:nil];
    
}
- (void)getNotification:(NSNotification *)notifi
{
    NSLog(@"消息对象是 %@",notifi);
}
- (void)getSSIDgetMACIP
{
    NSString *ssid = @"Not Found";
    NSString *macIp = @"Not Found";
    
    CFArrayRef myArray = CNCopySupportedInterfaces();
    if (myArray != nil) {
        CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
        if (myDict != nil) {
            NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
            
            ssid = [dict valueForKey:@"SSID"];
            macIp = [dict valueForKey:@"BSSID"];
            
            NSLog(@"ssid is %@",ssid);
            NSLog(@"macIP is %@",macIp);
            
        }
    }
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:ssid
                                                 message:macIp
                                                delegate:nil
                                       cancelButtonTitle:nil
                                       otherButtonTitles:@"OK", nil];
    [av show];

}
- (void)getCurrentTime
{
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    la.backgroundColor = [UIColor darkGrayColor];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentDateString = [formatter stringFromDate:[NSDate date]];
    
    NSLog(@"curTime is %@",currentDateString);
    
    la.text = currentDateString;
    [self.view addSubview:la];
    
   NSDate *nextD =  [[NSDate alloc] initWithTimeIntervalSinceNow:20];
    
    NSLog(@"20s latter is %@",nextD);

    //
    NSString *currentTime = [NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970] * 1000];
    NSLog(@"since1970 is %@",currentTime);
}

@end
