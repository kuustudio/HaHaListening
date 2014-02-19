//
//  SoundBook.m
//  ListeningBook
//
//  Created by wang yan on 14-2-19.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "SoundBook.h"

static NSString *const bookTitleIdentifier=@"bookTitleIdentifier";
static NSString *const bookLogoIdentifier=@"bookLogoIdentifier";
static NSString *const bookTimeIdentifier=@"bookTimeIdentifier";
static NSString *const bookCatagoryIdentifier=@"bookCatagoryIdentifier";

@implementation SoundBook

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self) {
        _bookTitle=[aDecoder decodeObjectForKey:bookTitleIdentifier];
        _bookLogo=[aDecoder decodeObjectForKey:bookLogoIdentifier];
        _bookTime=[aDecoder decodeObjectForKey:bookTimeIdentifier];
        _bookCatagory=[aDecoder decodeObjectForKey:bookCatagoryIdentifier];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_bookTitle forKey:bookTitleIdentifier];
    [aCoder encodeObject:_bookLogo forKey:bookLogoIdentifier];
    [aCoder encodeObject:_bookTime forKey:bookTimeIdentifier];
    [aCoder encodeObject:_bookCatagory forKey:bookCatagoryIdentifier];
}

@end
