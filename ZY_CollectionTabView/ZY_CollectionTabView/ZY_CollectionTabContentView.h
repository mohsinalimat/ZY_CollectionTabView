//
//  DLPickView.h
//  Demo
//
//  Created by Yanice on 16/2/2.
//  Copyright © 2016年 Yanice. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pickViewOffSetDelegate <NSObject>

- (void)pickOffSetIndex:(NSInteger)index;

@end

@interface ZY_CollectionTabContentView : UIView

@property (nonatomic, weak) id<pickViewOffSetDelegate>delegate;

- (void)setContentOffSet:(NSInteger)index;

@end
