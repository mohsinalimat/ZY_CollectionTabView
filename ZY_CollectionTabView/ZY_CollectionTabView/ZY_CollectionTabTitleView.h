//
//  DLTitleView.h
//  Demo
//
//  Created by Yanice on 16/2/2.
//  Copyright © 2016年 Yanice. All rights reserved.
//

#import <UIKit/UIKit.h>

#define titleCellWidth               95

@protocol titleViewOffSetDelegate <NSObject>

- (void)titleOffSetIndex:(NSInteger)index;

@end

@interface ZY_CollectionTabTitleView : UIView

@property (nonatomic, weak) id<titleViewOffSetDelegate>delegate;

- (void)setCOntentOffSet:(NSInteger)offSetIndex;

@end
