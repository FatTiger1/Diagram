//
//  DiagramView.h
//  Diagram
//
//  Created by default on 2019/1/4.
//  Copyright © 2019 default. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiagramView : UIView

@property(nonatomic,strong)NSArray * dataArray;
- (id)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
