//
//  BaseProtocol.h
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseProtocol <NSObject>

@required

@property (nonatomic, assign, readonly) float height;
@property (nonatomic, strong, readonly) NSString *identifier;

@optional

@property (nonatomic, strong, readonly) NSString *title;

@end
