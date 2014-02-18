//
//  BaseVCGenerator.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BaseVCGenerator.h"
#import <MMDrawerController.h>

#import "ListeningViewController.h"
#import "CatalogViewController.h"

#import "BaseViewMediator.h"

@implementation BaseVCGenerator


-(UIViewController *)generatorBaseVC
{
    UIViewController *centerVC=[[BaseViewMediator sharedMediator] defaultCenterVC];
    
    UINavigationController *centerNavC=[[UINavigationController alloc]initWithRootViewController:centerVC];
    
    ListeningViewController *listeningVC=[[ListeningViewController alloc] init];
    UINavigationController *listeningNavC=[[UINavigationController alloc]initWithRootViewController:listeningVC];
    
    CatalogViewController *catalogVC=[[CatalogViewController alloc] init];
    
    MMDrawerController *mmDrawerCon=[[MMDrawerController alloc]initWithCenterViewController:centerNavC leftDrawerViewController:catalogVC rightDrawerViewController:listeningNavC];
    
    [mmDrawerCon setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mmDrawerCon setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    return mmDrawerCon;
}

@end
