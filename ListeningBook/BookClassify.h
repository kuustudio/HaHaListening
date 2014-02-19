//
//  BookClassify.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookClassify : NSObject<NSCoding>

@property(nonatomic,strong)NSString *classifyID;
@property(nonatomic,strong)NSString *classifyName;

-(id)initWithID:(NSString *)classifyid WithName:(NSString *)classifyname;

-(void)encodeWithCoder:(NSCoder *)aCoder;

-(id)initWithCoder:(NSCoder *)aDecoder;

@end
