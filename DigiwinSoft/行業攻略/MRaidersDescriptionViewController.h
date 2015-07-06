//
//  MRaidersDescriptionViewController.h
//  DigiwinSoft
//
//  Created by kenn on 2015/6/22.
//  Copyright (c) 2015年 Jyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MGuide.h"
@interface MRaidersDescriptionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tbl;
    UIWebView *webViewVideo;
    UIButton *btn;
    UILabel *labTitle;
    NSArray *aryList;
}
@property (nonatomic, weak) MGuide *guide;
@end
