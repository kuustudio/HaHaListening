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

-(id)initWithID:(NSString *)classifyid WithName:(NSString *)classifyname
{
    self=[super init];
    if (self) {
        _classifyID=classifyid;
        _classifyName=classifyname;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self) {
        _classifyID=[aDecoder decodeObjectForKey:bookIdIdentifier];
        _classifyName=[aDecoder decodeObjectForKey:bookNameIdentifier];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_classifyID forKey:bookIdIdentifier];
    [aCoder encodeObject:_classifyName forKey:bookNameIdentifier];
}

@end
