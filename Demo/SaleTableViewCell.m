//
//  SaleTableViewCell.m
//  ChaoJiFan
//
//  Created by 朱洁珊 on 16/11/17.
//  Copyright © 2016年 zhujieshan. All rights reserved.
//

#import "SaleTableViewCell.h"

@implementation SaleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self setUI];
    }
    return self;
}

-(void)setUI{

    UIView *sepView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 10)];
    sepView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.15];
    [self addSubview:sepView];
    
    self.shopImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 115, 115)];
    self.shopImageView.image = [UIImage imageNamed:@"image"];
    [self addSubview:self.shopImageView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(145, 15, 216, 48)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titleLabel];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(144, 83, 60, 15)];
    self.priceLabel.textColor = [UIColor redColor];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.priceLabel];
    
    self.clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clickBtn.frame = CGRectMake(375-105, 108, 90, 33);
    self.clickBtn.layer.cornerRadius = 5;
    self.clickBtn.layer.borderWidth = 1;
    self.clickBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.clickBtn.layer.masksToBounds = YES;
    [self.clickBtn setTitle:@"马上抢" forState:UIControlStateNormal];
    [self.clickBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.clickBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.clickBtn addTarget:self action:@selector(clickBtnActions) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.clickBtn];
    
}

-(void)refreshUIWithTitle:(NSString *)title{
    NSString *str =  [title stringByAppendingString:@"\n"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString: title];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length])];
    self.titleLabel.attributedText = attributedString;
    
    self.priceLabel.text = @"¥ 9.99";
    
    CGFloat heights = [self boundingRectWithString:str];
    
    if (heights>55) {
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }else{
        self.titleLabel.numberOfLines = 2;
    }
    
}

- (CGFloat)boundingRectWithString:(NSString *)string
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(216, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    return  rect.size.height;
}

-(void)clickBtnActions{
    [self setSelected:YES animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
