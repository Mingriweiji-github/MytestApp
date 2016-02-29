//
//  CustomAlertView.h
//  MytestApp
//
//  Created by Mr.Li on 16/2/29.
//  Copyright © 2016年 Mr.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#if defined(__APPLE_CC__) && (__APPLE_CC__ >= 5549)
#define NS_REQUIRES_NIL_TERMINATION __attribute__((sentinel(0,1)))
#else
#define NS_REQUIRES_NIL_TERMINATION __attribute__((sentinel))
#endif

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kBCAlertViewPresentNotify   @"kBCAlertViewPresentNotify"  //alertview present notify



@class CustomAlertView;

@protocol MBAlertViewDelegate

@optional

// - 代理方法
-(void)alertView:(CustomAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)alertViewClosed:(CustomAlertView *)alertView;
-(void)willPresentCustomAlertView:(UIView *)alertView;

// - 隐藏实用类弹出键盘
- (void)hideCurrentKeyBoard;

@end
@interface CustomAlertView : UIView{}

@property (nonatomic, assign) id  delegate;
@property (nonatomic, assign) BOOL           isNeedCloseBtn;  // - 左上角带叉叉按钮
@property (nonatomic, retain) NSString       *title;
@property (nonatomic, retain) NSString       *message;
@property (nonatomic, retain) UIView         *backView;
@property (nonatomic, retain) UIView         *titleBackgroundView;
@property (nonatomic, retain) UILabel        *titleLabel;
@property (nonatomic, retain) UIImageView    *titleIcon;
@property (nonatomic, retain) NSMutableArray *customerViewsToBeAdd;

- (id)initWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate cancelButtonTitle:(NSString*)cancelButtonTitle otherButtonTitles:(NSString*)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

-(void)initTitle:(NSString*)title message:(NSString*)message delegate:(id)del cancelButtonTitle:(NSString*)cancelBtnTitle otherButtonTitles:(NSString*)otherBtnTitles, ...NS_REQUIRES_NIL_TERMINATION;

- (void) show ;

// - 在alertview中添加自定义控件
- (void)addCustomerSubview:(UIView *)view;

+ (void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur;

+ (CustomAlertView *)defaultAlert;

@end
