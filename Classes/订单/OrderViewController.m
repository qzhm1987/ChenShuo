//
//  OrderViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/23.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "OrderViewController.h"
#import "TableViewCell.h"
#import "OrderModel.h"

@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dataList;
@property (strong, nonatomic)UIView *bgView;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(order:) name:@"order" object:nil];
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)order:(NSNotification *)noti{
    NSString *orderPath = [KDoucumentPath stringByAppendingString:@"orders.plist"];
    _dataList = [NSMutableArray arrayWithCapacity:0];
    NSArray *array = [NSArray arrayWithContentsOfFile:orderPath];
    [_dataList addObjectsFromArray:array];
    [self.tableView reloadData];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma UITableViewDelegate&&DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dict = self.dataList[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:dict[@"image"]];
    cell.nameLabel.text = dict[@"name"];
    cell.priceLabel.text = dict[@"price"];
    cell.numberLabel.text = [NSString stringWithFormat:@"X %@",dict[@"number"]];
    cell.timeLabel.text = dict[@"addTime"];
    [cell.button addTarget:self action:@selector(tiqu:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


-(void)tiqu:(UIButton *)button{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.bgView];
    UIView *qrView = [UIView new];
    qrView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:qrView];
    [qrView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(240, 260));
    }];
    
    
    UIImageView *qrImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_code"]];
    [qrView addSubview:qrImageView];
    [qrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(qrView).offset(10);
        make.centerX.equalTo(qrView);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    UILabel *label = [UILabel new];
    label.textAlignment= NSTextAlignmentCenter;
    label.text = @"请凭此二维码到门店取货";
    [qrView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(qrView);
        make.top.equalTo(qrImageView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    
    
    
}

-(void)removeClick:(UITapGestureRecognizer *)gesture{
    [self.bgView removeFromSuperview];
    
}

#pragma mark Get method

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 150.0f;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
        _bgView.tag = 10;
        _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+49);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeClick:)];
        [_bgView addGestureRecognizer:tap];
    }
    
    return _bgView;
}

-(NSMutableArray *)dataList{
    if (!_dataList) {
        NSString *orderPath = [KDoucumentPath stringByAppendingString:@"orders.plist"];
        _dataList = [NSMutableArray arrayWithCapacity:0];
        NSArray *array = [NSArray arrayWithContentsOfFile:orderPath];
        [_dataList addObjectsFromArray:array];
    }
    return _dataList;
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
