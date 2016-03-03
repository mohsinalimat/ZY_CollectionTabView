//
//  DLPickView.m
//  Demo
//
//  Created by Yanice on 16/2/2.
//  Copyright © 2016年 Yanice. All rights reserved.
//

#import "ZY_CollectionTabContentView.h"
#import "ZY_CollectionTabContentViewCell.h"

@interface ZY_CollectionTabContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZY_CollectionTabContentView {

    UICollectionView *collection;
    NSMutableArray *dataArray;
    NSInteger currentIndex;
}

static NSString *cellIdentifiter = @"identifiter";
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configView];
    }
    return self;
}

- (void)configView {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, self.frame.size.height);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.pagingEnabled = YES;
    collection.showsHorizontalScrollIndicator = NO;
    collection.backgroundColor = [UIColor clearColor];
    [self addSubview:collection];
    [collection registerClass:[ZY_CollectionTabContentViewCell class] forCellWithReuseIdentifier:cellIdentifiter];
    
    [self fillData];
}

- (void)fillData {
    
    dataArray = [@[] mutableCopy];
    NSCalendar *canendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [canendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:[NSDate date]];
    for (int i=1; i<=[component month]; i++) {
        [dataArray addObject:@""];
    }
    [collection reloadData];
    currentIndex = dataArray.count-1;
    [collection scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:dataArray.count-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [dataArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZY_CollectionTabContentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiter forIndexPath:indexPath];
    NSMutableAttributedString *mastr = [[NSMutableAttributedString alloc] initWithString:@"¥ 1327"];
    [mastr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 1)];
    [mastr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:37] range:NSMakeRange(1, mastr.length-1)];
    cell.priceLabel.attributedText = mastr;
    cell.rewardLabel.text = @"已获得奖励:20元";
    cell.addReward.text = @"再获得663元可额外获得 200 元奖励";
    return cell;
}

- (void)setContentOffSet:(NSInteger)index {

    [collection setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*index, 0) animated:YES];
    NSLog(@"通过titleView更新数据。。。。。。%zd",index);
}

#pragma mark ====== scrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if ([self.delegate respondsToSelector:@selector(pickOffSetIndex:)]) {
        [self.delegate pickOffSetIndex:scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width];
    }
}

@end
