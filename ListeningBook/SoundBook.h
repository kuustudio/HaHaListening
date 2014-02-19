//
//  SoundBook.h
//  ListeningBook
//
//  Created by wang yan on 14-2-19.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundBook : NSObject<NSCoding>

@property(nonatomic,strong) UIImage *bookLogo;
@property(nonatomic,strong) NSString *bookTitle;
@property(nonatomic,strong) NSString *bookCatagory;
@property(nonatomic,strong) NSString *soundUrl;
@property(nonatomic,strong) NSString *bookTime;

@end
