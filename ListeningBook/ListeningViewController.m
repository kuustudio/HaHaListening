//
//  ListeningViewController.m
//  ListeningBook
//
//  Created by wang yan on 14-2-18.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "ListeningViewController.h"

@interface ListeningViewController ()

@end

@implementation ListeningViewController

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
    self.title=@"正在收听";
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    /*
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(navigationControllerLeftButtonClicked)];
    self.navigationItem.leftBarButtonItem=anotherButton;
     */
}
-(void)navigationControllerLeftButtonClicked
{
    
}
                                      
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
