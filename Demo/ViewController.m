//
//  ViewController.m
//  Demo
//
//  Created by yebaojia on 17/8/23.
//  Copyright © 2017年 JS. All rights reserved.
//

#import "ViewController.h"
#import "SaleTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong , nonatomic)UITableView *tableView;
@property (strong , nonatomic)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.title = @"Demo" ;
}

//分区下有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 156;
}

//cell的点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消某行的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SaleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusepool"];
    if (cell == nil){
        cell = [[SaleTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reusepool"];
    }
    [cell refreshUIWithTitle:self.dataArray[indexPath.row]];
    return cell;
}

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = @[@"温碧泉水光裸透气垫霜双色可选温碧泉水光温碧泉水光光->这里完了",@"小麦切菜板切水果砧板面板砧板面板->这里完了",@"超轻太阳伞自动遮阳防紫外线口袋伞超轻太阳伞自动遮阳防紫外->这里完了",@"hotjakakshdsalkhdajshdkjsjkadhjalkskdasdhakshdsalkhdaj->这里完了",@"hot（特产陕西手工凉皮特产真空擀面皮皮，5袋送1？！）->这里完了",@"迪土尼儿童双肩包->这里完了"];
    }
    return _dataArray;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
