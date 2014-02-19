//
//  ClassifyViewController.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "ClassifyViewController.h"

#import "BookClassify.h"

#import "BookListOfOneClassifyViewController.h"

@interface ClassifyViewController ()

@end

@implementation ClassifyViewController
{
    UITableView *_tableView;
    NSArray *_tableViewData;
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
    self.title=@"分类";
    [self.view setBackgroundColor:[UIColor magentaColor]];
    
    NSArray *classifyNameArray=@[@"全部",@"美国",@"世界",@"生活",@"娱乐",@"健康",@"教育",@"商务",@"科技",@"历史",@"单词故事"];
    NSArray *classifyIDArray=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    _tableViewData=[[NSArray alloc]init];
    for (int i=0; i<[classifyIDArray count]; i++) {
        BookClassify *bc=[[BookClassify alloc]initWithID:classifyIDArray[i] WithName:classifyNameArray[i]];
        _tableViewData=[_tableViewData arrayByAddingObject:bc];
    }
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    
}


#pragma --mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableViewData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"bookClassifycell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookClassifycell"];
    }
    BookClassify *bc=(BookClassify *)[_tableViewData objectAtIndex:indexPath.row];
    cell.textLabel.text=bc.classifyName;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookListOfOneClassifyViewController *bookListOfOneClassifyVC=[[BookListOfOneClassifyViewController alloc]init];
    BookClassify *bc=(BookClassify *)[_tableViewData objectAtIndex:indexPath.row];
    bookListOfOneClassifyVC.classifyID=bc.classifyID;
    bookListOfOneClassifyVC.classifyName=bc.classifyName;
    
    [self.navigationController pushViewController:bookListOfOneClassifyVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
