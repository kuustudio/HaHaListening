//
//  FileDownloader.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "JsonFileDownloader.h"

@implementation JsonFileDownloader
{
    NSURLConnection *_connection;
    NSMutableData *_jsonData;
}

-(void)downloadFileFromUrlStr:(NSString *)urlStr
{
    _jsonData=[[NSMutableData alloc]init];
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15];
    _connection=[[NSURLConnection alloc]initWithRequest:urlRequest delegate:self startImmediately:YES];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(receivedJsonFailed)]) {
        [self.delegate receivedJsonFailed];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_jsonData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //from GBK to UTF-8
    NSLog(@"connectionDidFinishLoading");
    NSError *error=nil;
    
    /*
    NSStringEncoding encode=CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *jsonStr=[[NSString alloc]initWithData:_jsonData encoding:encode];
    NSData *encodeJsonData=[jsonStr dataUsingEncoding:NSUTF8StringEncoding];
     */
    NSData *encodeJsonData=_jsonData;
    
    NSDictionary *objDict=nil;
    objDict=[NSJSONSerialization JSONObjectWithData:encodeJsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (error!=nil || objDict==nil) {
        if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(receivedJsonFailed)]) {
            [self.delegate receivedJsonFailed];
        }
    }else
    {
        if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(receivedJsonSuccessed:)]) {
            [self.delegate receivedJsonSuccessed:objDict];
        }
    }
}

@end
