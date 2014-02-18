//
//  BookClassifyList.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookClassifyList.h"

@implementation BookClassifyList

-(id)init
{
    self=[super init];
    if (self) {
        _bookClassifyArray=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addBookClassify:(BookClassify *)bookClassify
{
    [_bookClassifyArray addObject:bookClassify];
}

-(int)bookClassifyCount
{
    return [_bookClassifyArray count];
}

@end
