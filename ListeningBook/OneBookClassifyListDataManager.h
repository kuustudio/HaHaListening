//
//  BookClassifyDataManager.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OneBookClassifyListService.h"

@protocol OneBookClassifyListDataManagerDelegate;

@interface OneBookClassifyListDataManager : NSObject<JsonFileDownloaderDelegate>

@property(nonatomic,strong)id<OneBookClassifyListDataManagerDelegate> delegate;

-(void)getBookClassifyListById:(NSString *)classifyID;

@end

@protocol OneBookClassifyListDataManagerDelegate <NSObject>

-(void)getBookClassifyListComplateWithData:(NSArray *)listArray;

@end
