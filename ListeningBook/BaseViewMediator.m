//
//  BaseViewMediator.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BaseViewMediator.h"
#import "BaseVCGenerator.h"

#import "ClassifyViewController.h"
#import "FavoriteViewController.h"
#import "DownloadViewController.h"
#import "SettingViewController.h"


@implementation BaseViewMediator
{
    UIViewController *_baseVC;
}

- (id)init {
    if (self = [super init]) {
        _someProperty =@"I am baseView mediator.";
        _defaultCenterVC=(UIViewController *)[[ClassifyViewController alloc]init];
    }
    return self;
}


+ (id)sharedMediator {
    static BaseViewMediator *sharedMyMediator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyMediator = [[self alloc] init];
    });
    return sharedMyMediator;
}

//设置baseViewController
-(void)setBaseVC:(UIViewController *)vc
{
    _baseVC=vc;
}
//获取baseViewController
-(UIViewController *)getBaseVC
{
    return _baseVC;
}

//显示老的中间页面
-(void)backToCenterView
{
    MMDrawerController *tempBaseVC=(MMDrawerController *)_baseVC;
    [tempBaseVC closeDrawerAnimated:YES completion:nil];
}
//显示新的中间页面
-(void)showCenterWithViewController:(UIViewController *)controller
{
    MMDrawerController *tempBaseVC=(MMDrawerController *)_baseVC;
    UINavigationController *centerVCUINC=[[UINavigationController alloc]initWithRootViewController:controller];
    _defaultCenterVC=controller;
    [tempBaseVC setCenterViewController:centerVCUINC withFullCloseAnimation:YES completion:nil];
}


-(void)showCenterWithViewIdentifier:(NSInteger)index
{
    NSLog(@"showCenterWithViewIdentifier:%i",index);
    
    if (index==0) {
        //分类
        
        if ([_defaultCenterVC isKindOfClass:[ClassifyViewController class]]) {
            [self backToCenterView];
        }else
        {
            ClassifyViewController *centerVC=[[ClassifyViewController alloc]init];
            [self showCenterWithViewController:centerVC];
            
        }
        
    }else if(index==1)
    {
        //收藏
        if ([_defaultCenterVC isKindOfClass:[FavoriteViewController class]]) {
            [self backToCenterView];
        }else
        {
            FavoriteViewController *centerVC=[[FavoriteViewController alloc]init];
            [self showCenterWithViewController:centerVC];
            
        }
    }else if(index==2)
    {
        //下载
        if ([_defaultCenterVC isKindOfClass:[DownloadViewController class]]) {
            [self backToCenterView];
        }else
        {
            DownloadViewController *centerVC=[[DownloadViewController alloc]init];
            [self showCenterWithViewController:centerVC];
            
        }
    }else if(index==3)
    {
        //设置
        if ([_defaultCenterVC isKindOfClass:[SettingViewController class]]) {
            [self backToCenterView];
        }else
        {
            SettingViewController *centerVC=[[SettingViewController alloc]init];
            [self showCenterWithViewController:centerVC];
            
        }
    }
}


@end
