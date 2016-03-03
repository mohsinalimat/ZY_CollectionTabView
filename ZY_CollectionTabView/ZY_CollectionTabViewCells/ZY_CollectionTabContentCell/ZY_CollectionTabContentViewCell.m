//
//  DLPickViewCell.m
//  DLSpeakerLiving
//
//  Created by Yanice on 16/2/15.
//  Copyright © 2016年 LEE. All rights reserved.
//

#import "ZY_CollectionTabContentViewCell.h"

@implementation ZY_CollectionTabContentViewCell {

    UIButton *requestBtn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-152)/2+40, 69, 80, 12)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"我的收益:";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(label.frame)-20, CGRectGetMaxY(label.frame)+10, 112, 40)];
        self.priceLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.priceLabel];
        
        self.rewardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24+152+15, [UIScreen mainScreen].bounds.size.width, 10)];
        self.rewardLabel.textColor = [UIColor redColor];
        self.rewardLabel.font = [UIFont systemFontOfSize:13];
        self.rewardLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.rewardLabel];
        
        self.addReward = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.rewardLabel.frame)+10, [UIScreen mainScreen].bounds.size.width, 10)];
        self.addReward.textColor = [UIColor orangeColor];
        self.addReward.font = [UIFont systemFontOfSize:13];
        self.addReward.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.addReward];
        
        requestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        requestBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2+100, CGRectGetMaxY(self.rewardLabel.frame)+9.5, 11, 11);
        [requestBtn setImage:[UIImage imageNamed:@"personal_icon"] forState:UIControlStateNormal];
        [self addSubview:requestBtn];
        [requestBtn addTarget:self action:@selector(requestBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)requestBtnAction {
    NSLog(@"额外收益疑问");
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(([UIScreen mainScreen].bounds.size.width-152)/2, 24, 152, 152));
    CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:239/255.f green:239/255.f blue:239/255.f alpha:1.0f].CGColor);
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokePath(ctx);
}

@end
