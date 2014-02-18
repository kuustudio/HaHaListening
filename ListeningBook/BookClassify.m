//
//  BookClassify.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookClassify.h"

@implementation BookClassify

-(id)initWithID:(NSString *)bookid WithName:(NSString *)bookname
{
    self=[super init];
    if (self) {
        _bookID=bookid;
        _bookName=bookname;
    }
    return self;
}

@end
