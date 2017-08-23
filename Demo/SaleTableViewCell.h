//
//  SaleTableViewCell.h
//  ChaoJiFan
//
//  Created by 朱洁珊 on 16/11/17.
//  Copyright © 2016年 zhujieshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaleTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *shopImageView;
@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UILabel *priceLabel;
@property (strong , nonatomic) UILabel *numberLabel;
@property (strong , nonatomic) UIButton *clickBtn;
@property (assign , nonatomic) CGFloat progress;
@property (strong , nonatomic) NSString *robTimeStr;

-(void)refreshUIWithTitle:(NSString *)title;

@end
