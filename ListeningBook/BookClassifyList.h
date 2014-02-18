//
//  BookClassifyList.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BookClassify.h"

@interface BookClassifyList : NSObject

@property(nonatomic,copy)NSMutableArray *bookClassifyArray;

-(void)addBookClassify:(BookClassify *)bookClassify;

-(int)bookClassifyCount;

@end
