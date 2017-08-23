# demo
(iOS)关于UILabel设置了attributedText富文本之后超出显示后没有省略号

>很多时候我们绘制UI界面的时候,往往需要使用到富文本,比如一段话设置间距啊,设置不同的字号和颜色等等,但是设置了attributedText 后省略号不显示

##### 1.一开始我没设置间距时是这样显示的:

![小鹿优选.png](http://upload-images.jianshu.io/upload_images/1785610-62826328f6a73c7e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)


##### 2.我要设置一段文字的间距(如图)


![小鹿优选.PNG](http://upload-images.jianshu.io/upload_images/1785610-85fd845f41c6bc5b.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:model.title];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4*kHeightScale];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [model.title length])];
    self.titleLabel.attributedText = attributedString;

##### 3.我们可以发现,设置富文本后文字已经超出显示的部分竟然没有了省略号代替

<small>于是找了下原因,原来我们设置text的时候也会自动设置lineBreakMode,但设置attributedText后,lineBreakMode就会失效,直接切断显示的内容,并且没用省略号代替

如果你确保你所有的文字都需要加省略号,那就简单,一行代码搞定:
`self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;`

但是往往我们遇到的是这样的需求:
</small>

![小鹿优选](http://upload-images.jianshu.io/upload_images/1785610-a6ef5372a36dbe6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)

**我们往往遇到的是这种情况: 文字长度长短不一,只有当文字显示不完全的时候才出现省略号**

##### 4.解决办法

**我的需求是:**
<small>**1.固定2行的高度来显示文字**
**2.当文字显示不完全的时候出现省略号先计算出来**
**3.当文字为一行时贴紧上面而不是显示在中间**
</small>

**需求2的解决方法是:计算文字的高度,当超过2行的高度是设置lineBreakMode**

    CGFloat heights = [self boundingRectWithString:model.title];
    
    if (heights>55*kHeightScale) {
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }else{
        self.titleLabel.numberOfLines = 2;
    }

    //计算高度的方法,可自行封装
      - (CGFloat)boundingRectWithString:(NSString *)string{
      //216为UILabel的宽度
    CGRect rect = [string boundingRectWithSize:CGSizeMake(216, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14*kWidthScale]} context:nil];
    return  rect.size.height;
     }

**需求3的解决方法是:暴力解决,直接文字拼接上\n换行**

我们设置了UILabel的固定高度后,如果里面的内容填不上UILabel的高度,比如只有一行的时候,UILabel会吧文字自动的显示在UILabel的中间,如下图:


![小鹿优选.png](http://upload-images.jianshu.io/upload_images/1785610-c56bad11a000262d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)


**这个问题比较好解决,只要拼接上换行好就好了@"\n"**

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString: [[@"        " stringByAppendingString:model.title] stringByAppendingString:@"\n\n"]];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5*kHeightScale];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [model.title length])];
    self.titleLabel.attributedText= attributedString;

![小鹿优选.png](http://upload-images.jianshu.io/upload_images/1785610-c08829caa1a55771.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)


------如果你有更好的解决方法,欢迎提出来!!!
