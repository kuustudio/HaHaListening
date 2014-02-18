//
//  CenterViewController.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIBarButtonItem *rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"正在收听" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClicked:)];
        rightBarButtonItem.tag=0;
        self.navigationItem.rightBarButtonItem=rightBarButtonItem;
        
        UIBarButtonItem *leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"功能菜单" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClicked:)];
        self.navigationItem.leftBarButtonItem=leftBarButtonItem;
        
        leftBarButtonItem.tag=1;
    }
    return self;
}

-(void)barButtonItemClicked:(UIBarButtonItem *)barButtonItem
{
    if (barButtonItem.tag==0) {
        [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    }else if(barButtonItem.tag==1)
    {
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
