//
//  BookListOfOneClassifyTableViewCell.m
//  ListeningBook
//
//  Created by wang yan on 14-2-19.
//  Copyright (c) 2014年 小小菜鸟. All rights reserved.
//

#import "BookListOfOneClassifyTableViewCell.h"

@implementation BookListOfOneClassifyTableViewCell
{
    UIImageView *_bookLogo;
    UILabel *_bookTitle;
    UILabel *_bookCatagory;
    UILabel *_soundUrl;
    UILabel *_bookTime;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bookLogo=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 450/5, 300/5)];
        [self addSubview:_bookLogo];
        _bookTitle=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 40)];
        [self addSubview:_bookTitle];
        _bookCatagory=[[UILabel alloc]initWithFrame:CGRectMake(100, 50, 100, 40)];
        [self addSubview:_bookCatagory];
        _bookTitle=[[UILabel alloc]initWithFrame:CGRectMake(210, 50, 100, 40)];
        [self addSubview:_bookTitle];
    }
    return self;
}

-(void)setSoundBook:(SoundBook *)soundBook
{
    _soundBook=soundBook;
    _bookTitle.text=_soundBook.bookTitle;
    _bookCatagory.text=_soundBook.bookCatagory;
    _bookTime.text=_soundBook.bookTime;
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
