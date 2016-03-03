//
//  DLTitleView.m
//  Demo
//
//  Created by Yanice on 16/2/2.
//  Copyright © 2016年 Yanice. All rights reserved.
//

#import "ZY_CollectionTabTitleView.h"
#import "ZY_CollectionTabTitleCell.h"

@interface ZY_CollectionTabTitleView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZY_CollectionTabTitleView {
    
    UICollectionView *collection;
    UIView *scrollIndicator;
    NSMutableArray *dataArray;
    CGFloat totalOffSet; // 记录scrollToItemAtIndexPath 最开始的偏移量,偏于下半部分移动时计算item的偏移
}

static NSString *cellIdentifiter = @"identifiter";

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self configView];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)configView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(titleCellWidth, 33);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.showsHorizontalScrollIndicator = NO;
    collection.contentSize = CGSizeMake(100, 33);
    collection.backgroundColor = [UIColor clearColor];
    [self addSubview:collection];
    [collection registerClass:[ZY_CollectionTabTitleCell class] forCellWithReuseIdentifier:cellIdentifiter];
    
    scrollIndicator = [[UIView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-50)/2, 30, 50, 3)];
    scrollIndicator.backgroundColor = [UIColor blackColor];
    [self addSubview:scrollIndicator];
    
    [self fillData];
}

- (void)fillData {

    dataArray = [@[] mutableCopy];
    NSCalendar *canendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [canendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:[NSDate date]];
    [dataArray addObject:@""];
    [dataArray addObject:@""];
    for (int i=1; i<=[component month]; i++) {
        NSString *datestr = [NSString stringWithFormat:@"%zd-%zd",[component year],i];
        [dataArray addObject:datestr];
    }
    [collection reloadData];
    collection.contentInset = UIEdgeInsetsMake(0, -(2*titleCellWidth-[UIScreen mainScreen].bounds.size.width/2+titleCellWidth/2+1), 0, [UIScreen mainScreen].bounds.size.width/2-titleCellWidth/2);
    [collection scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:dataArray.count-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [dataArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ZY_CollectionTabTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiter forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.dateLabel.text = dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row<2) {
        return;
    }
    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    if ([self.delegate respondsToSelector:@selector(titleOffSetIndex:)]) {
        [self.delegate titleOffSetIndex:indexPath.row-2];
    }
}

- (void)setCOntentOffSet:(NSInteger)offSetIndex {
    
    [collection scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:offSetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark 设置自身的偏移量
- (void)setConllectionContentOffSetx:(CGFloat)offsetX {
    
    NSInteger offSetIndex = offsetX/titleCellWidth;
    [collection scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:offSetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    if ([self.delegate respondsToSelector:@selector(titleOffSetIndex:)]) {
        [self.delegate titleOffSetIndex:offSetIndex];
    }
}
#pragma mark === scrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    totalOffSet = scrollView.contentOffset.x;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self setConllectionContentOffSetx:scrollView.contentOffset.x];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [self setConllectionContentOffSetx:scrollView.contentOffset.x];
}

@end
