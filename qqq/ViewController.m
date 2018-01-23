//
//  ViewController.m
//  qqq
//
//  Created by Developer on 2018/1/21.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "ViewController.h"
#import "HJGTableViewCell.h"
#import "HJGModel.h"
#import <BRPickerView.h>
#import "FlLocalStoreManager.h"
#import "HJGBottomTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) UIButton *addBut;

@property (nonatomic, strong) UIButton *changeBut;

@property (nonatomic, strong) NSMutableArray *modelArr;

@property (nonatomic, strong) UIButton *saveBut;

@property (nonatomic, strong) UIButton *cleanBut;

@property (nonatomic, strong) UIView *bottomView;


@end

@implementation ViewController


- (UIView *)bottomView
{
    if (!_bottomView) {
        UIView * theView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        tap.numberOfTapsRequired = 2;
        [theView addGestureRecognizer:tap];
        _bottomView = theView;
    }
    return _bottomView;
}


- (void)tapClick{
    
    [self addButClick];
    
}


- (UIButton *)cleanBut
{
    if (!_cleanBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"清除" forState:UIControlStateNormal];
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(cleanButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(25);
            make.size.equalTo(CGSizeMake(80, 70));
            make.left.equalTo(self.changeBut.right);
        }];
        _cleanBut = theView;
    }
    return _cleanBut;
}

- (void)cleanButClick{
    
//    [FlLocalStoreManager removeUserInfo];
    
    [self.modelArr removeAllObjects];
    [self.rootTableView reloadData];
}


- (void)saveButClick{
    
    [FlLocalStoreManager saveUserInfo:self.modelArr];
    
}


- (UIButton *)saveBut
{
    if (!_saveBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"保存" forState:UIControlStateNormal];
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(saveButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(25);
            make.size.equalTo(CGSizeMake(80, 70));
            make.right.equalTo(self.addBut.left);
        }];
        _saveBut = theView;
    }
    return _saveBut;
}

- (UIButton *)changeBut
{
    if (!_changeBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"切换新牌手" forState:0];
        [theView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(changeButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(25);
            make.size.equalTo(CGSizeMake(120, 70));
            make.left.equalTo(self.view);
        }];
        _changeBut = theView;
    }
    return _changeBut;
}

- (void)changeButClick{
    
    HJGModel *model = [[HJGModel alloc]init];
    model.change = @"1";
    [self.modelArr addObject:model];
    [self.rootTableView reloadData];
    
}

- (NSMutableArray *)modelArr{
    
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;

}



- (UIButton *)addBut
{
    if (!_addBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"添加新一局" forState:0];
        [theView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(addButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(25);
            make.size.equalTo(CGSizeMake(120, 70));
            make.right.equalTo(self.view);
        }];
        _addBut = theView;
    }
    return _addBut;
}

- (void)addButClick{
    
    HJGModel *model = [[HJGModel alloc]init];
    [self.modelArr addObject:model];
    [self.rootTableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self changeBut];
    [self addBut];
    [self rootTableView];
    
    [self cleanBut];
//    [self saveBut];
    
    NSLog(@"========================%@",[FlLocalStoreManager getUserInfo]);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addButClick];
        });
    });
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, HEIGHT)];
        theView.delegate = self;
        theView.dataSource = self;
        [self.view addSubview:theView];
        [theView registerClass:[HJGTableViewCell class] forCellReuseIdentifier:@"cell"];
        [theView registerClass:[HJGBottomTableViewCell class] forCellReuseIdentifier:@"bCell"];
        _rootTableView = theView;
    }
    return _rootTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section

{
    return [[UIView alloc]init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelArr.count + 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == self.modelArr.count) {
        HJGBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bCell"];
        // 双击的 Recognizer
        UITapGestureRecognizer * doubleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(douClick)];
        doubleRecognizer.numberOfTapsRequired = 2; // 双击
        //关键语句，给self.view添加一个手势监测；
        [cell.bottomView addGestureRecognizer:doubleRecognizer];
        cell.selectionStyle = 0;
        return cell;
    }
    
    HJGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    [cell.firstBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.secondBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.thirdBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.forthBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.fifthBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
////    [cell.sixBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.zhuangBut addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [cell.firstBut addTarget:self action:@selector(doubleClick:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    [cell.firstBut  addTarget:self action:@selector(singleClick:forEvent:) forControlEvents:UIControlEventTouchDown];
    
    [cell.secondBut addTarget:self action:@selector(doubleClick:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    [cell.secondBut  addTarget:self action:@selector(singleClick:forEvent:) forControlEvents:UIControlEventTouchDown];
    
    
    [cell.thirdBut addTarget:self action:@selector(doubleClick:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    [cell.thirdBut  addTarget:self action:@selector(singleClick:forEvent:) forControlEvents:UIControlEventTouchDown];
    
    
    [cell.forthBut addTarget:self action:@selector(doubleClick:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    [cell.forthBut  addTarget:self action:@selector(singleClick:forEvent:) forControlEvents:UIControlEventTouchDown];
    
    
    [cell.fifthBut addTarget:self action:@selector(doubleClick:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    [cell.fifthBut  addTarget:self action:@selector(singleClick:forEvent:) forControlEvents:UIControlEventTouchDown];
    
    [cell.zhuangBut addTarget:self action:@selector(doubleClick:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    [cell.zhuangBut  addTarget:self action:@selector(singleClick:forEvent:) forControlEvents:UIControlEventTouchDown];
    
    
    cell.model = [self.modelArr objectAtIndex:indexPath.row];
//    cell.firstBut.layer.borderColor = RGB(198, 198, 198).CGColor;
//    cell.secondBut.layer.borderColor = RGB(198, 198, 198).CGColor;
//    cell.thirdBut.layer.borderColor = RGB(198, 198, 198).CGColor;
//    cell.forthBut.layer.borderColor = RGB(198, 198, 198).CGColor;
//    cell.fifthBut.layer.borderColor = RGB(198, 198, 198).CGColor;
    cell.preLab.text = [NSString stringWithFormat:@"第%ld局",indexPath.row + 1];
    cell.selectionStyle = 0;
    return cell;
}


-(void)singleClick:(UIButton *)button forEvent:(UIEvent *)event{
    
    [self performSelector:@selector(cellClick:) withObject:button afterDelay:0.2];
    
}

-(void)doubleClick:(UIButton *)button forEvent:(UIEvent *)event
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(cellClick:) object:button];
    
    NSLog(@"双击操作");
    
    button.layer.borderColor  = RGB(198, 198, 198).CGColor;
    [button setTitle:@"" forState:UIControlStateNormal];
    
    HJGTableViewCell *cell = (HJGTableViewCell *)[[button superview] superview];
    
    NSIndexPath *indexPa = [self.rootTableView indexPathForCell:cell];
    
    HJGModel *model = [self.modelArr objectAtIndex:indexPa.row];
    
    if (button.tag == 1) {
        model.Number_1 = @"";
    }else if (button.tag == 2){
        model.Number_2 = @"";
    }else if (button.tag == 3){
        model.Number_3 = @"";
    }else if (button.tag == 4){
        model.Number_4 = @"";
    }else if (button.tag == 5){
        model.Number_5 = @"";
    }else if (button.tag == 6){
        model.Number_6 = @"";
    }else if (button.tag == 7){
        model.Number_zhuang = @"";
        NSLog(@"000000_%@",model.Number_zhuang);

    }
    
    [self.rootTableView reloadData];
}


- (void)douClick{
    
    [self addButClick];
}

- (void)cellClick:(UIButton *)but{

    [self timeButClick:but];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.modelArr.count) {
        return 300;
    }
    return 50;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self getHeaderView];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 150;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

- (UIView *)getHeaderView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *zhuoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH - 80, 40)];
    zhuoLab.textAlignment = NSTextAlignmentCenter;
    zhuoLab.text = @"           桌1       桌2      桌3    桌4     桌5";
    [view addSubview:zhuoLab];
    
    
    UILabel *zhuang = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH - 80, 0, 80, 40)];
    zhuang.textAlignment = NSTextAlignmentCenter;
    zhuang.text = @"庄家";
    [view addSubview:zhuang];
    return view;
    
}



- (void)timeButClick:(UIButton *)but{
    
    NSArray *arr = @[
                     @"牛1----------------14",
                     @"牛2----------------15",
                     @"牛3----------------16",
                     @"牛4----------------17",
                     @"牛5----------------18",
                     @"牛6----------------19",
                     @"牛7----------------20",
                     @"牛8----------------21",
                     @"牛9----------------22",
                     @"牛牛10----------------23",
                     @"牛牛J----------------24",
                     @"牛牛Q----------------25",
                     @"牛牛K----------------26",
                     @"无牛-1----------------1",
                     @"无牛-2----------------2",
                     @"无牛-3----------------3",
                     @"无牛-4----------------4",
                     @"无牛-5----------------5",
                     @"无牛-6----------------6",
                     @"无牛-7----------------7",
                     @"无牛-8----------------8",
                     @"无牛-9----------------9",
                     @"无牛-10----------------10",
                     @"无牛-J----------------11",
                     @"无牛-Q----------------12",
                     @"无牛-K----------------13",];

    @weakify_self;
    [BRStringPickerView showStringPickerWithTitle:@"飞式牛牛记牌器" dataSource:arr defaultSelValue:@"牛1----------------14" isAutoSelect:NO resultBlock:^(id selectValue) {
        @strongify_self;
//        NSLog(@"%@",selectValue);
    
        
        
        HJGTableViewCell *cell = (HJGTableViewCell *)[[but superview] superview];
        
        NSIndexPath *indexPa = [self.rootTableView indexPathForCell:cell];
        
        HJGModel *model = [self.modelArr objectAtIndex:indexPa.row];
        if (but.tag == 1) {
            model.Number_1 = selectValue;
            if (model.Number_zhuang.length > 0) {
                [self compareBut:but xianText:selectValue zhuangText:model.Number_zhuang];
            }
        }else if (but.tag == 2){
            model.Number_2 = selectValue;
            if (model.Number_zhuang.length > 0) {
                [self compareBut:but xianText:selectValue zhuangText:model.Number_zhuang];
            }
        }else if (but.tag == 3){
            model.Number_3 = selectValue;
            if (model.Number_zhuang.length > 0) {
                [self compareBut:but xianText:selectValue zhuangText:model.Number_zhuang];
            }
        }else if (but.tag == 4){
            model.Number_4 = selectValue;
            if (model.Number_zhuang.length > 0) {
                [self compareBut:but xianText:selectValue zhuangText:model.Number_zhuang];
            }
        }else if (but.tag == 5){
            model.Number_5 = selectValue;
            if (model.Number_zhuang.length > 0) {
                [self compareBut:but xianText:selectValue zhuangText:model.Number_zhuang];
            }
        }else if (but.tag == 6){
            model.Number_6 = selectValue;
        }else if (but.tag == 7){
            model.Number_zhuang = selectValue;
            NSLog(@"000000_%@",model.Number_zhuang);
            [self compareBut:cell.firstBut xianText:model.Number_1 zhuangText:model.Number_zhuang];
            [self compareBut:cell.secondBut xianText:model.Number_2 zhuangText:model.Number_zhuang];
            [self compareBut:cell.thirdBut xianText:model.Number_3 zhuangText:model.Number_zhuang];
            [self compareBut:cell.forthBut xianText:model.Number_4 zhuangText:model.Number_zhuang];
            [self compareBut:cell.fifthBut xianText:model.Number_5 zhuangText:model.Number_zhuang];

        }
        
        [self.rootTableView reloadData];
    }];
    
    
}

- (void)compareBut:(UIButton *)but xianText:(NSString *)xianText zhuangText:(NSString *)zhuangText
{

    if ([xianText containsString:@"----------------"]&&[zhuangText containsString:@"----------------"]) {
        NSString *xian = [self sub_str:xianText];
        NSString *zhuang = [self sub_str:zhuangText];
        if ([xian intValue] > [zhuang intValue]) {
            but.layer.borderColor = [UIColor redColor].CGColor;
        }else{
            but.layer.borderColor = RGB(198, 198, 198).CGColor;
        }
    }
    
}


- (NSString *)sub_str:(NSString *)str{
    
    NSArray *arr = [str componentsSeparatedByString:@"----------------"];
    
    return [arr objectAtIndex:1];
}


@end
