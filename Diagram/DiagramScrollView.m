//
//  DiagramScrollView.m
//  Diagram
//
//  Created by default on 2019/1/4.
//  Copyright © 2019 default. All rights reserved.
//

#import "DiagramScrollView.h"


@interface DiagramScrollView ()
@property(nonatomic,assign)CGRect sFrame;
@end
@implementation DiagramScrollView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.sFrame = frame;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray{
    for (UIView * view in self.subviews) {
        [view removeFromSuperview];
    }
    _dataArray = dataArray;
    [self setUp];
}

- (void)setUp{
    self.contentSize = CGSizeMake((self.gapX+self.lineWidth) *self.dataArray.count, 0);
    for (int i = 0; i < self.dataArray.count; i ++) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(i*(self.lineWidth+self.gapX), self.sFrame.size.height-30, self.lineWidth+self.gapX, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:9];
        label.text = [NSString stringWithFormat:@"%d月",i+1];
        [self addSubview:label];
    }
    for (int i = 0; i < self.dataArray.count; i ++) {
        int value = (int)[self.dataArray[i] integerValue];
        CGFloat heigth = value/250.f * (self.sFrame.size.height-70);
        CGFloat x = self.gapX/2+ i * (self.gapX+self.lineWidth);
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(x, self.sFrame.size.height - 30-heigth, self.lineWidth, heigth)];
        lineView.backgroundColor = [UIColor colorWithRed:241/255.f green:181/255.f blue:13/255.f alpha:1];
        [self addSubview:lineView];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(i*(self.lineWidth+self.gapX), CGRectGetMinY(lineView.frame)-20, self.lineWidth+self.gapX, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:241/255.f green:181/255.f blue:13/255.f alpha:1];
        label.font = [UIFont systemFontOfSize:9];
        label.text = [NSString stringWithFormat:@"%d",value];
        [self addSubview:label];
    }
}

@end
