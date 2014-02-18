//
//  BookClassify.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookClassify.h"

static NSString *const bookIdIdentifier = @"bookClassifyIdIdentifier";
static NSString *const bookNameIdentifier = @"bookClassifyNameIdentifier";

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

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self) {
        _bookID=[aDecoder decodeObjectForKey:bookIdIdentifier];
        _bookName=[aDecoder decodeObjectForKey:bookNameIdentifier];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_bookID forKey:bookIdIdentifier];
    [aCoder encodeObject:_bookName forKey:bookNameIdentifier];
}

@end
