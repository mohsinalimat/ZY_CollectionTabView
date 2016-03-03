//
//  DLMyInComeView.m
//  DLSpeakerLiving
//
//  Created by Yanice on 16/2/1.
//  Copyright © 2016年 LEE. All rights reserved.
//

#import "ZY_CollectionTabView.h"
#import "ZY_CollectionTabTitleView.h"
#import "ZY_CollectionTabContentView.h"

@interface ZY_CollectionTabView ()<titleViewOffSetDelegate,pickViewOffSetDelegate>

@property (nonatomic, strong) ZY_CollectionTabTitleView *titleView;
@property (nonatomic, strong) ZY_CollectionTabContentView *pickView;
@property (nonatomic, strong) UILabel *sepLine;
@property (nonatomic, strong) UIView *bottomIV;

@end

@implementation ZY_CollectionTabView

- (ZY_CollectionTabTitleView *)titleView {
    
    if (_titleView==nil) {
        _titleView = [[ZY_CollectionTabTitleView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 33)]; // SCREEN_WIDTH/2+titleCellWidth/2
        _titleView.delegate = self;
    }
    return _titleView;
}

- (ZY_CollectionTabContentView *)pickView {
    
    if (_pickView==nil) {
        _pickView = [[ZY_CollectionTabContentView alloc] initWithFrame:CGRectMake(0, 33, self.frame.size.width, self.frame.size.height-83)];
        _pickView.delegate = self;        
    }
    return _pickView;
}
- (UILabel *)sepLine {
    
    if (_sepLine==nil) {
        _sepLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, [UIScreen mainScreen].bounds.size.width, 1)];
        _sepLine.backgroundColor = [UIColor colorWithRed:239/255.f green:239/255.f blue:239/255.f alpha:1.0f];
    }
    return _sepLine;
}

- (UIView *)bottomIV {
    
    if (_bottomIV==nil) {
        _bottomIV = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-50, [UIScreen mainScreen].bounds.size.width, 50)];
        _bottomIV.backgroundColor = [UIColor whiteColor];
        UILabel *sepTop = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
        sepTop.backgroundColor = [UIColor colorWithRed:239/255.f green:239/255.f blue:239/255.f alpha:1.0f];
        [_bottomIV addSubview:sepTop];
        
        UILabel *sepBom = [[UILabel alloc] initWithFrame:CGRectMake(0, 49, [UIScreen mainScreen].bounds.size.width, 1)];
        sepBom.backgroundColor = [UIColor colorWithRed:239/255.f green:239/255.f blue:239/255.f alpha:1.0f];
        [_bottomIV addSubview:sepBom];
        
        UILabel *myProfitLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 120, 50)];
        myProfitLabel.backgroundColor = [UIColor clearColor];
        myProfitLabel.text = @"今日收益：¥12.25";
        myProfitLabel.font = [UIFont systemFontOfSize:14];
        [_bottomIV addSubview:myProfitLabel];
        
        UIButton *profitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        profitBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-80-39, 10, 80, 30);
        [profitBtn setTitle:@"收益记录" forState:UIControlStateNormal];
        [profitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        profitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_bottomIV addSubview:profitBtn];
        [profitBtn addTarget:self action:@selector(profitBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bottomIV;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleView];
        [self addSubview:self.pickView];
        [self addSubview:self.sepLine];
        [self addSubview:self.bottomIV];
    }
    return self;
}

- (void)profitBtnAction {

    NSLog(@"收益记录");
}
- (void)titleOffSetIndex:(NSInteger)index {
    [self.pickView setContentOffSet:index];
}
- (void)pickOffSetIndex:(NSInteger)index {
    [self.titleView setCOntentOffSet:index];
}

@end
