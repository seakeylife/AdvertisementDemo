//
//  NewsModel.h
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong, readonly) NSString *title;

@property (nonatomic, assign, readonly) float height;

@property (nonatomic, strong, readonly) NSString *identifier;

@end
