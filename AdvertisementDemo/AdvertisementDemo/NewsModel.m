//
//  NewsModel.m
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

- (NSString *)title {
    
    return [NSString stringWithFormat:@"新闻%ld",(long)_index];
}

- (float)height {
    
    return 100;
}

- (NSString *)identifier {
    
    return @"newsIdentifier";
}

@end
