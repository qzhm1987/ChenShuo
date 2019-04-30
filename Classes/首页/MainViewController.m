//
//  MainViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "MainViewController.h"
#import "CollectionViewCell.h"
#import "OrderModel.h"



@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSMutableArray *dataList;
@property (strong, nonatomic)NSMutableArray *hotList;
@property (strong, nonatomic)UIView *bgView;
@property (strong, nonatomic)UIView *detailView;
@property (nonatomic,assign)NSInteger number;
@property (strong, nonatomic)UILabel *numberLabel;
@property (strong, nonatomic)OrderModel *currentOrder;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.title = @"首页";
    [self addOrderTableDB];
    
    [self loadMainCollectionUI];
    [self addMainUI];
    // Do any additional setup after loading the view.
}
-(void)addOrderTableDB{
    NSString *dbPath = [KDoucumentPath stringByAppendingPathComponent:@"order.db"];
    //创建数据库实例
    FMDatabase *db;
    db = [[FMDatabase alloc]initWithPath:dbPath];
    [db open];
    if (![db open]) {
        return;
    }
   NSString *sql = @"create table if not exists orderTable ('ID' INTEGER PRIMARY KEY AUTOINCREMENT,'image' TEXT NOT NULL,'name' TEXT NOT NULL, 'price' TEXT NOT NULL,'addTime' TEXT NOT NULL,'number' INTEGER NOT NULL)";
    BOOL result = [db executeUpdate:sql];
    if (result) {
        NSLog(@"create table success");
    }
    [db close];
}

-(void)addMainUI{
    UIImageView *banner = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_banner"]];
    [self.collectionView  addSubview:banner];
    [banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView).offset(40);
        make.centerX.equalTo(self.collectionView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 378/2.0f));
    }];
    UIView *hotView  = [[UIView alloc]init];
    hotView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.collectionView addSubview:hotView];
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(banner);
        make.top.equalTo(banner.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 225));
    }];
    UILabel *hotlabel = [UILabel new];
    hotlabel.backgroundColor = [UIColor whiteColor];
    hotlabel.text = @"— 热销订制 —";
    hotlabel.textAlignment = NSTextAlignmentCenter;
    [hotView addSubview:hotlabel];
    [hotlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(hotView);
        make.top.equalTo(hotView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 45));
    }];
    
    
    UIScrollView  *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.collectionView addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(hotView);
        make.top.equalTo(hotlabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 165));
    }];
    
    scrollView.contentSize = CGSizeMake(120*4, 165);
    
    for (int i=0; i<4; i++) {
        NSDictionary *dict =self.hotList[i];
        OrderModel *order = [[OrderModel alloc]init];
        [order setValuesForKeysWithDictionary:dict];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.tag = 20+i;
        imageView.image = [UIImage imageNamed:order.image];
        [scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(scrollView.mas_bottom).offset(0);
            make.left.equalTo(scrollView).offset(10+i*115);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = order.name;
        [titleLabel sizeToFit];
        [scrollView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView);
            make.top.equalTo(imageView.mas_bottom).offset(0);
            make.size.mas_equalTo(CGSizeMake(120, 30));
        }];
        UILabel *priceLabel = [UILabel new];
        priceLabel.text = order.price;
        priceLabel.textColor = [UIColor redColor];
        [titleLabel sizeToFit];
        [scrollView addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView);
            make.top.equalTo(titleLabel.mas_bottom).offset(0);
            make.size.mas_equalTo(CGSizeMake(120, 25));
        }];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageView addGestureRecognizer:tap];
        
        
        
        
    }
    
    UILabel *newlabel = [UILabel new];
    newlabel.backgroundColor = [UIColor whiteColor];
    newlabel.text = @"— 新品专区 —";
    newlabel.textAlignment = NSTextAlignmentCenter;
    [self.collectionView addSubview:newlabel];
    [newlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.collectionView);
        make.top.equalTo(hotView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 45));
    }];
}


-(void)loadMainCollectionUI{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10.0f;
    flowLayout.minimumInteritemSpacing = 10.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(450, 10, 49, 10);
    CGFloat itemWidth = (SCREEN_WIDTH-30)/2;
    flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth+60);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollEnabled = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"kouhongCell"];
    
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataList.count;
}
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.dataList[indexPath.row];
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kouhongCell" forIndexPath:indexPath];
    cell.logoView.image = [UIImage imageNamed:dict[@"image"]];
    cell.titleLabel.text = dict[@"name"];
    cell.priceLabel.text = dict[@"price"];
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.dataList[indexPath.row];
    OrderModel *order = [[OrderModel alloc]init];
    [order setValuesForKeysWithDictionary:dict];
    
    self.currentOrder = order;
    [self addOrderUIWithoderModel:order];
}

#pragma mark Gesture Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.detailView]) {
        return NO;
    }
    return YES;
}

-(void)addOrderUIWithoderModel:(OrderModel *)order{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.bgView];
    
    UIView *view = [UIView new];
    view.layer.cornerRadius  = 5.0f;
    view.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(260, 350));
    }];
    self.detailView = view;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:order.image]];
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.top.equalTo(view).offset(10);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = order.name;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.top.equalTo(imageView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(260, 30));
    }];
    UILabel *priceLabel = [UILabel new];
    priceLabel.text = order.price;
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = [UIFont systemFontOfSize:15.0f];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.top.equalTo(nameLabel.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(260, 25));
    }];
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:15.0f];
    label.text = @"数量";
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(25);
        make.top.equalTo(priceLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(35, 30));
    }];
    UILabel *jianLabel = [UILabel new];
    jianLabel.text = @"-";
    jianLabel.textAlignment = NSTextAlignmentCenter;
    jianLabel.layer.borderWidth = 0.5f;
    jianLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    jianLabel.layer.cornerRadius = 10.0f;
    [view addSubview:jianLabel];
    [jianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_centerX).offset(10);
        make.top.equalTo(priceLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    UITapGestureRecognizer *jianTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jianClick:)];
    [jianLabel addGestureRecognizer:jianTap];
    
    UILabel *jiaLabel = [UILabel new];
    jiaLabel.text = @"+";
    jiaLabel.textAlignment = NSTextAlignmentCenter;
    jiaLabel.layer.borderWidth = 0.5f;
    jiaLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    jiaLabel.layer.cornerRadius = 10.0f;
    [view addSubview:jiaLabel];
    [jiaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(view).offset(-20);
        make.top.equalTo(priceLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    UITapGestureRecognizer *jiaTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jiaClick:)];
    [jiaLabel addGestureRecognizer:jiaTap];
    
    jianLabel.userInteractionEnabled = YES;
    jiaLabel.userInteractionEnabled = YES;
    
    self.number = 1;
    UILabel *numLabel = [UILabel new];
    numLabel.text = @"1";
    numLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jianLabel).offset(0);
        make.left.equalTo(jianLabel.mas_right).offset(5);
        make.right.equalTo(jiaLabel.mas_left).offset(0);
        make.height.mas_equalTo(20);
    }];
    self.numberLabel = numLabel;
    UIImageView *locationView = [UIImageView new];
    locationView.image = [UIImage imageNamed:@"location"];
    [view addSubview:locationView];
    [locationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(30);
        make.top.equalTo(label.mas_bottom).offset(25);
        make.size.mas_equalTo(CGSizeMake(12,12));
    }];
    
    UILabel *addressLabel = [UILabel new];
    addressLabel.font = [UIFont systemFontOfSize:12.0f];
    addressLabel.text = @"石家庄中兴路东路南花间坊";
    addressLabel.textColor = [UIColor lightGrayColor];
    [view addSubview:addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(locationView.mas_right).offset(10);
        make.centerY.equalTo(locationView);
        make.size.mas_equalTo(CGSizeMake(180, 25));
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 15.0f;
    button.backgroundColor = [UIColor colorWithRed:255.0f/255.0 green:67.0f/255.0 blue:108.0f/255.0 alpha:1.0f];
    [button setTitle:@"预定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(yuding:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.bottom.equalTo(view).offset(-30);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
}

-(void)tapClick:(UITapGestureRecognizer *)gesture{
    NSInteger index = gesture.view.tag-20;
    NSDictionary *dict = self.hotList[index];
    OrderModel *order = [[OrderModel alloc]init];
    [order setValuesForKeysWithDictionary:dict];
    
    self.currentOrder = order;
    
    [self addOrderUIWithoderModel:order];
    
    
    
    
}

-(void)yuding:(UIButton *)button{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *phone = [userDefault objectForKey:@"phone"];
    
    if (phone) {
        [self.bgView removeFromSuperview];
        self.currentOrder.number = self.number;
        self.currentOrder.addTime =[self getCurrentTimeStringWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
        NSMutableArray *orderArray = [NSMutableArray arrayWithCapacity:0];
        NSString *arraystring = [[NSUserDefaults standardUserDefaults] objectForKey:@"json"];
        NSArray *array = [self jsonStringToArray:arraystring];
        [orderArray addObjectsFromArray:array];
        NSDictionary *dict = [self.currentOrder yy_modelToJSONObject];
        [orderArray addObject:dict];
        NSString *jsonString =[self arraryToJSONString:orderArray];
        [userDefault setObject:jsonString forKey:@"json"];
        NSLog(@"json = %@",jsonString);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"order" object:nil];
    }else{
        [AppDel goLoginRootController];
    }
    
    
    
    
}
-(void)removeClick:(UITapGestureRecognizer *)gesture{
    [self.bgView removeFromSuperview];

}

-(void)jianClick:(UITapGestureRecognizer *)gesture{
    self.number--;
    if (self.number<1) {
        self.number=1;
    }
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.number];
}
-(void)jiaClick:(UITapGestureRecognizer *)gesture{
      self.number++;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.number];
}

-(NSString *)getCurrentTimeStringWithFormatter:(NSString *)formatterString{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterString];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}


-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
        _bgView.tag = 10;
        _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+49);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeClick:)];
        tap.delegate = self;
        [_bgView addGestureRecognizer:tap];
    }
    
    return _bgView;
}




-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray arrayWithCapacity:0];
        NSArray *array = @[@{@"image":@"img_ysl",@"name":@"圣罗兰（YSL）",@"price":@"￥309.00"},@{@"image":@"img_dior",@"name":@"哈尼小熊",@"price":@"￥188.00"},@{@"image":@"img_heelaa",@"name":@"荷拉（HeeLaa）",@"price":@"￥99.00"},@{@"image":@"img_ysld",@"name":@"雅诗兰黛",@"price":@"￥278.00"},@{@"image":@"img_mbl",@"name":@"美宝莲",@"price":@"￥89.00"},@{@"image":@"img_mkfd",@"name":@"美康粉黛",@"price":@"￥88.00"},@{@"image":@"img_oly",@"name":@"欧莱雅",@"price":@"￥109.00"},@{@"image":@"img_zhyq",@"name":@"稚优泉",@"price":@"￥49.00"}];
        [_dataList addObjectsFromArray:array];
    }
    return _dataList;
}

-(NSMutableArray *)hotList{
    if (!_hotList) {
        _hotList = [NSMutableArray arrayWithCapacity:0];
        NSArray *array = @[@{@"image":@"home_img_dior",@"name":@"迪奥（Dior）",@"price":@"￥299.00"},@{@"image":@"home_img_ysl",@"name":@"圣罗兰",@"price":@"￥309.00"},@{@"image":@"home_img_kzl",@"name":@"卡姿兰",@"price":@"￥98.00"},@{@"image":@"home_img_amn",@"name":@"阿玛尼",@"price":@"￥309.00"}];
        [_hotList addObjectsFromArray:array];
    }
    return _hotList;
}

-(NSString *)arraryToJSONString:(NSArray *)array {
    NSData *data = [NSJSONSerialization dataWithJSONObject:array
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
    
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}
-(NSArray *)jsonStringToArray:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                      
                                                     options:NSJSONReadingMutableContainers
                      
                                                       error:&err];
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return array;
    
    
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
