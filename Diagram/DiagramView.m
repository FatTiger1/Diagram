//
//  DiagramView.m
//  Diagram
//
//  Created by default on 2019/1/4.
//  Copyright © 2019 default. All rights reserved.
//

#import "DiagramView.h"
#import "DiagramScrollView.h"
static CGFloat lineWidth = 14;
@interface DiagramView ()
@property(nonatomic,assign)CGRect sFrame;
@property(nonatomic,strong)DiagramScrollView * backScrollView;
@property(nonatomic,assign)CGFloat gapX;
@property(nonatomic,assign)CGFloat gapY;
@property(nonatomic,assign)int maxY;
@property(nonatomic,assign)int gapValue;
@end

@implementation DiagramView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.sFrame = frame;
        [self setUp];
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self initData];
    [self setScrollViewData];
}

- (void)initData{
    if (self.dataArray.count <= 7) {
        self.gapX = (self.sFrame.size.width - 45 - lineWidth*self.dataArray.count)/self.dataArray.count;
    }else{
        self.gapX = (self.sFrame.size.width - 45 - lineWidth*7)/7;
    }
    [self setMaxValue];
    [self setGapValue];
    
}

- (void)setMaxValue{
    for (int i = 0; i < self.dataArray.count; i ++) {
        self.maxY = MAX(self.maxY, [self.dataArray[i] intValue]);
    }
}

- (void)setGapValue{
    NSString * maxYString = [NSString stringWithFormat:@"%d",self.maxY];
    int half = 1;
    for (int i = 0; i < maxYString.length-3; i ++) {
        half = half * 10;
    }
   
    self.maxY = (self.maxY + half*9)/(half*10) * (half*10);//保证第三位是0
    //需要保证第二位是5 或者是0
    
    int second = (self.maxY / (half*10))%10;
    if (second < 5) {
        second = 5;
    }
    
    self.gapValue = self.maxY/5;
    [self setlablesText];
}

- (void)setlablesText{
    for (int i = 0 ; i < 6; i ++) {
        UILabel * label = [self viewWithTag:100 + i];
        label.text = [NSString stringWithFormat:@"%d",self.gapValue * i];
    }
}

- (void)setScrollViewData{
    self.backScrollView.gapX = self.gapX;
    self.backScrollView.gapY = self.gapX;
    self.backScrollView.lineWidth = lineWidth;
    self.backScrollView.max = self.maxY;
    self.backScrollView.dataArray = self.dataArray;
}

- (void)setUp{
    [self addYLabels];
    [self addScrollView];
}

- (void)addYLabels{
    self.gapY = (self.sFrame.size.height - 30 - 40)/5;
    for (int i  = 0; i < 6; i ++) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.sFrame.size.height - 30 - self.gapY*i - 9, 20, 9)];
        label.tag = 100 + i;
        
        label.font = [UIFont systemFontOfSize:9];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}

- (void)addScrollView{
    self.backScrollView = [[DiagramScrollView alloc] initWithFrame:CGRectMake(25, 0, self.sFrame.size.width - 45, self.sFrame.size.height)];
    self.backScrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backScrollView];
}

- (void)drawRect:(CGRect)rect{
    [self drawY];
    [self drawX];
}

- (void)drawY{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(25, self.sFrame.size.height - 30)];
    [path addLineToPoint:CGPointMake(25, 40-10)];
    path.lineWidth = 1;
    [[UIColor lightGrayColor] set];
    [path stroke];
}

- (void)drawX{
    for (int i = 0; i < 6; i ++) {
        UIBezierPath * path = [UIBezierPath bezierPath];
        [[UIColor lightGrayColor] set];
        path.lineWidth = 1;
        [path moveToPoint:CGPointMake(20,self.sFrame.size.height - 30 - self.gapY*i)];
        [path addLineToPoint:CGPointMake(self.sFrame.size.width - 20, self.sFrame.size.height - 30 - self.gapY*i)];
        if (i > 0) {
            path.lineWidth = 0.5;
            CGFloat dashPattern[] = {2,2};
            [path setLineDash:dashPattern count:1 phase:1];
        }
        [path stroke];
    }
}

@end
