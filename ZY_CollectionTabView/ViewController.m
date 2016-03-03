//
//  ViewController.m
//  ZY_CollectionTabView
//
//  Created by Yanice on 16/3/3.
//  Copyright © 2016年 Yanice. All rights reserved.
//

#import "ViewController.h"

#import "ZY_CollectionTabView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZY_CollectionTabView *tabView = [[ZY_CollectionTabView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 400)];
    [self.view addSubview:tabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
