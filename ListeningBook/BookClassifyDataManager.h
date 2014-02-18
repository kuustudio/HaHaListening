//
//  BookClassifyDataManager.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BookClassifyService.h"

@interface BookClassifyDataManager : NSObject<JsonFileDownloaderDelegate>

-(void)getBookClassifyList;

@end
