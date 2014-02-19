//
//  BookListOfOneClassifyViewController.h
//  ListeningBook
//
//  Created by wang yan on 14-2-19.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneBookClassifyListDataManager.h"

@interface BookListOfOneClassifyViewController : UIViewController<OneBookClassifyListDataManagerDelegate>

@property(nonatomic,strong)NSString *classifyID;
@property(nonatomic,strong)NSString *classifyName;

@end
