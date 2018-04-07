//
//  AdvertisementTableViewCell.h
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertisementTableViewCell : UITableViewCell

@end

@interface AdvertisementForScrollImageTableViewCell : AdvertisementTableViewCell

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, assign) CGFloat maxHeight;

@property (nonatomic, assign) CGPoint contentOffset;

@end
