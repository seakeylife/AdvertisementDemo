//
//  BaseModel.h
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseProtocol.h"

@interface BaseModel : NSObject <BaseProtocol>

@property (nonatomic, assign, readonly) float height;
@property (nonatomic, strong, readonly) NSString *identifier;

@end
