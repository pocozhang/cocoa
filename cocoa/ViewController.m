//
//  ViewController.m
//  cocoa
//
//  Created by admin on 17/3/10.
//  Copyright © 2017年 yueyue. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TableViewCell.h"

#define SCREENWITDH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UIImageView *view1;
    UIImageView *view2;
    UIImageView *view3;
    UIImageView *view4;
    UIView *viewShadowView1;
    UIView *viewShadowView2;
    BOOL isFold;
    NSInteger num;
    UITableView *TableView;
    NSMutableArray *heightArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    view1 = [[UIImageView alloc] init];
//    view1.layer.contentsRect = CGRectMake(0, 0, 1, 0.25);
////    view1.layer.anchorPoint = CGPointMake(0.5, 0.0);
//    view1.image = [UIImage imageNamed:@"11111.jpg"];
//    [self.view addSubview:view1];
//    
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(100);
//        make.top.equalTo(self.view).offset(100);
////        make.leftMargin.equalTo(@100);
////        make.topMargin.equalTo(@100);
////        make.height.equalTo(@100);
//        make.size.mas_equalTo(CGSizeMake(250,61/2.0));
//    }];
//    
//    view2 = [[UIImageView alloc] initWithFrame:CGRectZero];
//    view2.layer.contentsRect = CGRectMake(0, 0.25, 1, 0.25);
////    view2.layer.anchorPoint = CGPointMake(0.5, 1.0);
//    view2.image = [UIImage imageNamed:@"11111.jpg"];
//    [self.view addSubview:view2];
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(100);
//        make.top.equalTo(view1).offset(61/2.0);
//        make.size.mas_equalTo(CGSizeMake(250,61/2.0));
//    }];
//    
//    view3 = [[UIImageView alloc] initWithFrame:CGRectZero];
//    view3.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.25);
////    view3.layer.anchorPoint = CGPointMake(0.5, 0.0);
//    view3.image = [UIImage imageNamed:@"11111.jpg"];
//    [self.view addSubview:view3];
//    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view2).offset(61/2.0);
//        make.left.equalTo(self.view).offset(100);
//        make.size.mas_equalTo(CGSizeMake(250,61/2.0));
//    }];
//    
//    view4 = [[UIImageView alloc] initWithFrame:CGRectZero];
//    view4.layer.contentsRect = CGRectMake(0, 0.75, 1, 0.25);
////    view4.layer.anchorPoint = CGPointMake(0.5, 1.0);
//    view4.image = [UIImage imageNamed:@"11111.jpg"];
//    [self.view addSubview:view4];
//    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view3).offset(61/2.0);
//        make.left.equalTo(self.view).offset(100);
//        make.size.mas_equalTo(CGSizeMake(250,61/2.0));
//    }];
//    
//    
//    
//    viewShadowView1 = [[UIView alloc] initWithFrame:view1.bounds];
//    viewShadowView1.backgroundColor = [UIColor blackColor];
//    viewShadowView1.alpha = 0.0;
//    
//    viewShadowView2 = [[UIView alloc] initWithFrame:view3.bounds];
//    viewShadowView2.backgroundColor = [UIColor blackColor];
//    viewShadowView2.alpha = 0.0;
//    [view1 addSubview:viewShadowView1];
//    [view3 addSubview:viewShadowView2];
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 100, 50)];
//    [btn setTitle:@"折叠" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(fold) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
//    heightArr = [NSMutableArray array];
//    TableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//    TableView.dataSource = self;
//    TableView.delegate = self;
//    [self.view addSubview:TableView];
//    [TableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leftMargin.equalTo(@0);
//        make.topMargin.equalTo(@50);
//        make.size.mas_equalTo(CGSizeMake(SCREENWITDH, SCREENHEIGHT-50));
//    }];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"======================>heightForRowAtIndexPath");
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    if (indexPath.row == 5) {
        cell.title = @"哒哒哒";
    }
    NSLog(@"======================>UITableViewCell");
    num = [cell getAutoCellHeight];
    return cell;
}

- (void)fold{
    if (!isFold) {
        [UIView animateWithDuration:1.0 animations:^{
            viewShadowView1.alpha = 0.2;
            viewShadowView2.alpha = 0.2;
            view1.layer.transform = [self config3DTransformWithRotateAngle:-45.0 andPositionY:0];
            view2.layer.transform = [self config3DTransformWithRotateAngle:45.0 andPositionY:-61+2*view1.frame.size.height];
            view3.layer.transform = [self config3DTransformWithRotateAngle:-45.0 andPositionY:-61*1.5+3*view1.frame.size.height];
            view4.layer.transform = [self config3DTransformWithRotateAngle:45.0 andPositionY:-62*2+4*view1.frame.size.height];
            
        } completion:^(BOOL finished) {
            isFold = ! isFold;
        }];
    }else{
        [UIView animateWithDuration:1.0 animations:^{
            viewShadowView1.alpha = 0.0;
            viewShadowView2.alpha = 0.0;
            view1.layer.transform = CATransform3DIdentity;
            view2.layer.transform = CATransform3DIdentity;
            view3.layer.transform = CATransform3DIdentity;
            view4.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            isFold = ! isFold;
        }];
    }
}

- (CATransform3D)config3DTransformWithRotateAngle:(double)angle andPositionY:(double)y
{
    CATransform3D transform = CATransform3DIdentity;
    // 立体
    transform.m34 = -1/1000.0;
    // 旋转
    CATransform3D rotateTransform = CATransform3DRotate(transform, M_PI*angle/180, 1, 0, 0);
    // 移动(这里的y坐标是平面移动的的距离,我们要把他转换成3D移动的距离.这是关键,没有它,图片就没办法很好地对接。)
    CATransform3D moveTransform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(0, y));
    // 合并
    CATransform3D concatTransform = CATransform3DConcat(rotateTransform, moveTransform);
    return concatTransform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
