//
//  AdvertisementTableViewCell.m
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import "AdvertisementTableViewCell.h"

@implementation AdvertisementTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@interface AdvertisementForScrollImageTableViewCell () {
    
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIImageView *_imageView;
    
    __weak IBOutlet NSLayoutConstraint *_imageHeightLayoutConstraint;
    
}

@end

@implementation AdvertisementForScrollImageTableViewCell

- (void)setMaxHeight:(CGFloat)maxHeight {
    
    _maxHeight = maxHeight;
    
    _imageHeightLayoutConstraint.constant = maxHeight;
}

- (void)setUrl:(NSURL *)url {
    
    _url = url;
        
    __weak typeof(self)bself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        __strong typeof(bself)sself = bself;
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            sself->_imageView.image = [UIImage imageWithData:data];
        });
    });
}

- (void)setContentOffset:(CGPoint)contentOffset {
    
    _contentOffset = contentOffset;
    
    [_scrollView setContentOffset:contentOffset];
}

@end
