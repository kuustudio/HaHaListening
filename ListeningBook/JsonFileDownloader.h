//
//  FileDownloader.h
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JsonFileDownloaderDelegate;


@interface JsonFileDownloader: NSObject<NSURLConnectionDelegate>

@property(nonatomic,strong)id<JsonFileDownloaderDelegate> delegate;

-(void)downloadFileFromUrlStr:(NSString *)urlStr;

@end


@protocol JsonFileDownloaderDelegate <NSObject>

-(void)receivedJsonSuccessed:(NSDictionary *)objDict;

-(void)receivedJsonFailed;

@end