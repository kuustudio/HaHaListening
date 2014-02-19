//
//  BookListOfOneClassifyViewController.m
//  ListeningBook
//
//  Created by wang yan on 14-2-19.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookListOfOneClassifyViewController.h"
#import "BookListOfOneClassifyTableViewCell.h"

static NSString *const cellIdentifier=@"BookListOfOneClassifyTableViewCellIdentifier";

@interface BookListOfOneClassifyViewController ()

@end

@implementation BookListOfOneClassifyViewController
{
    UITableView *_tableview;
    NSArray *_tableDataArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=_classifyName;
    
    _tableview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    [_tableview registerClass:[BookListOfOneClassifyTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:_tableview];
    
    OneBookClassifyListDataManager *oneBCListManager=[[OneBookClassifyListDataManager alloc]init];
    oneBCListManager.delegate=self;
    [oneBCListManager getBookClassifyListById:_classifyID];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getBookClassifyListComplateWithData:(NSArray *)listArray
{
    _tableDataArray=listArray;
    [_tableview reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableDataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookListOfOneClassifyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[BookListOfOneClassifyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.soundBook=[_tableDataArray objectAtIndex:indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
