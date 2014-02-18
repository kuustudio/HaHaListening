//
//  BookClassifyDataManager.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookClassifyDataManager.h"
#import "BookClassify.h"

@implementation BookClassifyDataManager
{
    NSMutableArray *_objArray;
}

-(void)getBookClassifyList
{
    _objArray=[[NSMutableArray alloc]init];
    BookClassifyService *bookClassifySer=[[BookClassifyService alloc]init];
    bookClassifySer.delegate=self;
    [bookClassifySer downloadFileFromUrlStr:@"22http://download.ios.bizhi.sogou.com/wallpapers.php?cate_id=200&p=1&t=&width=640&height=1136"];
}

-(void)receivedJsonFailed
{
   _objArray=[self readListFromLocal];
    NSLog(@"2%@",_objArray);
}

-(void)receivedJsonSuccessed:(NSDictionary *)objDict
{
    NSDictionary *tempJsonDic=objDict;
    NSArray *tempArray=[tempJsonDic objectForKey:@"wallpaper"];
    int listcount=[tempArray count];
    
    for (int i=0; i<listcount; i++) {
        BookClassify *tempBC=[[BookClassify alloc]initWithID:[tempArray[i] objectForKey:@"d"] WithName:[tempArray[i] objectForKey:@"id"]];
        
        [_objArray addObject:tempBC];
    }
    
    NSLog(@"1%@",_objArray);
    
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
