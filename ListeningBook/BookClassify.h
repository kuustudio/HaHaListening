//
//  BookClassify.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookClassify : NSObject<NSCoding>

@property(nonatomic,strong)NSString *bookID;
@property(nonatomic,strong)NSString *bookName;

-(id)initWithID:(NSString *)bookid WithName:(NSString *)bookname;

-(void)encodeWithCoder:(NSCoder *)aCoder;

-(id)initWithCoder:(NSCoder *)aDecoder;

@end
