//
//  BookListOfOneClassifyViewController.m
//  ListeningBook
//
//  Created by wang yan on 14-2-19.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookListOfOneClassifyViewController.h"

@interface BookListOfOneClassifyViewController ()

@end

@implementation BookListOfOneClassifyViewController

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
    NSLog(@"%@",listArray);
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
