//
//  DLTitleCollectionViewCell.m
//  DLSpeakerLiving
//
//  Created by Yanice on 16/2/2.
//  Copyright © 2016年 LEE. All rights reserved.
//

#import "ZY_CollectionTabTitleCell.h"

@implementation ZY_CollectionTabTitleCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.dateLabel.textAlignment = NSTextAlignmentCenter;
        self.dateLabel.textColor = [UIColor blackColor];
        self.dateLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.dateLabel];
    }
    return self;
}
@end
