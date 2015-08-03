//
//  MEfficacyViewController.m
//  DigiwinSoft
//
//  Created by kenn on 2015/7/28.
//  Copyright (c) 2015年 Jyun. All rights reserved.
//

#import "MEfficacyViewController.h"
#import "MConfig.h"
#import "MRadarChartView.h"
#import "MRouletteViewController.h"
#import "MBarChartView.h"
#import "MDataBaseManager.h"
#import "MEfficacy.h"
#define CELL_DISTANCE 10
@interface MEfficacyViewController ()<UIScrollViewDelegate>

@property (nonatomic, assign) CGRect viewRect;
@property (nonatomic, strong) UIScrollView *mScroll;
@property (nonatomic, strong) UIScrollView *mScrollPage;
@property (nonatomic, strong) MRadarChartView* RadarChart;
@property (nonatomic, strong) NSArray *aryData;
@property (nonatomic, strong) UICollectionView *mCollection;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation MEfficacyViewController
- (id)initWithFrame:(CGRect) rect {
    self = [super init];
    if (self) {
        _viewRect = rect;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareData];
    [self createScroll];
    [self createRadarChart];
    [self createPageControl];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareData
{
    _aryData = [[MDataBaseManager sharedInstance]loadCompanyEfficacyArray];
}
#pragma mark - create view
-(void)createScroll
{
    _mScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+40, DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT-64-49-40)];
    _mScroll.backgroundColor=[UIColor whiteColor];
    _mScroll.contentSize=CGSizeMake(DEVICE_SCREEN_WIDTH, 480.);
    [self.view addSubview:_mScroll];
    
    _mScrollPage=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 240, DEVICE_SCREEN_WIDTH, 220)];
    _mScrollPage.backgroundColor=[UIColor lightGrayColor];
    _mScrollPage.pagingEnabled=NO;
    _mScrollPage.delegate=self;
    [_mScroll addSubview:_mScrollPage];
    

    CGFloat posX = CELL_DISTANCE*2;
    
    //_mScrollPage內容
    CGFloat pageWidth = DEVICE_SCREEN_WIDTH - 40;
    for (int i=0; i<[_aryData count]; i++) {
        MBarChartView *BarChart=[[MBarChartView alloc]initWithFrame:CGRectMake(posX, 0, pageWidth, 210)];
        BarChart.aryBarData=_aryData[i];
        BarChart.backgroundColor = [UIColor whiteColor];
        [_mScrollPage addSubview:BarChart];
        
        posX += CELL_DISTANCE + pageWidth;
        
    }
    
    posX += CELL_DISTANCE*2;
    
    _mScrollPage.contentSize=CGSizeMake(posX, 0);
    
}
-(void)createRadarChart
{
    _RadarChart = [[MRadarChartView alloc] initWithFrame:CGRectMake((DEVICE_SCREEN_WIDTH/2)-100, 20, 200, 200)];
    _RadarChart.aryRadarChartData=_aryData;
    [_mScroll addSubview:_RadarChart];
}
-(void)createPageControl
{
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0,220, DEVICE_SCREEN_WIDTH, 20)];
    _pageControl.backgroundColor = [UIColor lightGrayColor];
    [_pageControl setNumberOfPages:[_aryData count]];
    [_pageControl setCurrentPage:0];
    [_mScroll addSubview:_pageControl];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSInteger page = self.pageControl.currentPage;
    CGFloat width;
    width =_mScrollPage.contentSize.width/[_aryData count]-10;
    [_mScrollPage setContentOffset:CGPointMake(page*width, 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    //pageControl
    CGFloat width = DEVICE_SCREEN_WIDTH - 40;
    NSInteger currentPage = ((_mScrollPage.contentOffset.x - width / 2) / width) + 1;
    [self.pageControl setCurrentPage:currentPage];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
