//
//  BookClassifyDataManager.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "OneBookClassifyListDataManager.h"
#import "SoundBook.h"

static NSString *const baseURL=@"http://apps.iyuba.com/voa/titleApi.jsp?maxid=0&type=iOS&format=json&pages=1&pageNum=10&parentID=";

@implementation OneBookClassifyListDataManager
{
    NSMutableArray *_objArray;
}

-(void)getBookClassifyListById:(NSString *)classifyID;
{
    _objArray=[[NSMutableArray alloc]init];
    OneBookClassifyListService *bookClassifySer=[[OneBookClassifyListService alloc]init];
    bookClassifySer.delegate=self;
    
    NSString *url=[baseURL stringByAppendingString:classifyID];
    
    NSLog(@"url:%@",url);
    
    [bookClassifySer downloadFileFromUrlStr:url];
}

-(void)receivedJsonFailed
{
    _objArray=[self readListFromLocal];
    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(getBookClassifyListComplateWithData:)]) {
        [self.delegate getBookClassifyListComplateWithData:_objArray];
    }
}

-(void)receivedJsonSuccessed:(NSDictionary *)objDict
{
    NSDictionary *tempJsonDic=objDict;
    NSArray *tempArray=[tempJsonDic objectForKey:@"data"];
    NSInteger listcount=[tempArray count];
    for (int i=0; i<listcount; i++) {
        SoundBook *tempBC=[[SoundBook alloc]init];
        tempBC.bookCatagory=[tempArray[i] objectForKey:@"VoaId"];
        tempBC.bookLogo=[tempArray[i] objectForKey:@"Pic"];
        tempBC.bookTime=[tempArray[i] objectForKey:@"PublishTime"];
        tempBC.bookTitle=[tempArray[i] objectForKey:@"Title_cn"];
        [_objArray addObject:tempBC];
    }
    
    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(getBookClassifyListComplateWithData:)]) {
        [self.delegate getBookClassifyListComplateWithData:_objArray];
    }
    
    [self saveListToLocal];
}

-(void)saveListToLocal
{
    // 确定存储路径，一般是Document目录下的文件
    [NSKeyedArchiver archiveRootObject:_objArray toFile:[self bookClassifyListfilePath]];
}

-(NSMutableArray *)readListFromLocal
{
    NSMutableArray *tempArray=[NSKeyedUnarchiver unarchiveObjectWithFile:[self bookClassifyListfilePath]];
    return tempArray;
}

-(NSString *)bookClassifyListfilePath
{
    NSString* fileName = @"bookClassify.dat";
    NSString* filePath = [NSHomeDirectory() stringByAppendingPathComponent:fileName];
    return filePath;
}

@end
