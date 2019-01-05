//
//  DiagramScrollView.h
//  Diagram
//
//  Created by default on 2019/1/4.
//  Copyright © 2019 default. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiagramScrollView : UIScrollView
@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,assign)CGFloat gapX;
@property(nonatomic,assign)CGFloat gapY;
@property(nonatomic,assign)int max;
@end

NS_ASSUME_NONNULL_END
