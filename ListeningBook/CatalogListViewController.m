//
//  CatalogListViewController.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "CatalogListViewController.h"

#import "BaseViewMediator.h"

@interface CatalogListViewController ()

@end

static NSString *const cellIndentifier=@"cellIndentifier";

@implementation CatalogListViewController
{
    NSArray *_listDataArray;
    UITableView *_tableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _listDataArray=@[@"分类",@"收藏",@"下载",@"设置"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    float statusBarHeight=[[UIApplication sharedApplication]statusBarFrame].size.height;
    
    self.tableView.contentInset=UIEdgeInsetsMake(statusBarHeight,0,0,0);
    
    self.tableView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-statusBarHeight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView
{
    _tableView=[[UITableView alloc]init];
    self.tableView=_tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listDataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tempCell=[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (tempCell==nil) {
        tempCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    tempCell.textLabel.text=[_listDataArray objectAtIndex:indexPath.row];
    
    return tempCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[BaseViewMediator sharedMediator]showCenterWithViewIdentifier:indexPath.row];
}

@end
