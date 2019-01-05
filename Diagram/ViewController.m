//
//  ViewController.m
//  Diagram
//
//  Created by default on 2019/1/4.
//  Copyright © 2019 default. All rights reserved.
//

#import "ViewController.h"
#import "DiagramView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp{
    DiagramView * diagramView = [[DiagramView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    diagramView.backgroundColor = [UIColor colorWithRed:254/255.f green:247/255.f blue:217/255.f alpha:1];
    [self.view addSubview:diagramView];
    NSArray * array = @[@"100",@"104",@"203",@"140",@"123",@"260",@"234",@"213",@"203",@"140",@"123",@"260",@"234",@"213"];
    diagramView.dataArray = array;
}

@end
