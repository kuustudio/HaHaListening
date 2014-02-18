//
//  BaseViewMediator.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewMediator : UIViewController

@property (nonatomic, retain) NSString *someProperty;

@property(nonatomic,strong)UIViewController *defaultCenterVC;

+ (id)sharedMediator;

-(void)setBaseVC:(UIViewController *)vc;
-(UIViewController *)getBaseVC;

-(void)showCenterWithViewIdentifier:(NSInteger)index;

@end
