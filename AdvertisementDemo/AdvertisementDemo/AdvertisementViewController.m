//
//  AdvertisementViewController.m
//  AdvertisementDemo
//
//  Created by sea on 2018/4/7.
//  Copyright © 2018年 seakey. All rights reserved.
//

#import "AdvertisementViewController.h"

#import "BaseProtocol.h"

#import "NewsModel.h"
#import "AdvertisementModel.h"

#import "NewsTableViewCell.h"
#import "AdvertisementTableViewCell.h"

@interface AdvertisementViewController () {
    
    __weak IBOutlet UITableView *_tableView;
    
    NSArray <BaseProtocol>*_modelArray;
}

@end

@implementation AdvertisementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDefaultModel {
    
    NSMutableArray <BaseProtocol>*array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50; i++) {
        
        id <BaseProtocol> model = nil;
        
        if (i % 15 == 0 && i > 0) {
            
            AdvertisementModel *advertisement = [[AdvertisementModel alloc] init];
            
            advertisement.imageURL = [[NSBundle mainBundle] URLForResource:@"landscape" withExtension:@"jpg"];
            
            model = advertisement;
        }
        else {
            
            NewsModel *news = [[NewsModel alloc] init];
            news.index = i;
            
            model = news;
        }
        
        if (model != nil) {
            
            [array addObject:model];
        }
    }
    
    _modelArray = array;
}

#pragma mark - table view datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id <BaseProtocol> model = _modelArray[indexPath.row];
    
    return model.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id <BaseProtocol> model = _modelArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[NewsTableViewCell class]]) {
        
        NewsTableViewCell *newsCell = (NewsTableViewCell *)cell;
        
        newsCell.newsLabel.text = model.title;
    }
    else if ([cell isKindOfClass:[AdvertisementForScrollImageTableViewCell class]]) {
        
        AdvertisementForScrollImageTableViewCell *advertisementCell = (AdvertisementForScrollImageTableViewCell *)cell;
        
        advertisementCell.url = ((AdvertisementModel *)model).imageURL;
        advertisementCell.maxHeight = CGRectGetHeight(tableView.frame);
    }
    
    return cell;
}

-(void)scrollViewDidScroll:(UITableView *)scrollView{
    
    NSArray *visCells = scrollView.visibleCells;
    
    __weak typeof(self)bself = self;
    
    [visCells enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        __strong typeof(bself)sself = bself;
        
        if ([obj isKindOfClass:[AdvertisementForScrollImageTableViewCell class]]) {
            
            AdvertisementForScrollImageTableViewCell *advertisementCell = obj;
            
            NSIndexPath *indexPath = [sself->_tableView indexPathForCell:advertisementCell];
            
            AdvertisementModel *advertisementModel = sself->_modelArray[indexPath.row];
            
            CGFloat maxOff = sself->_tableView.bounds.size.height - advertisementModel.height;
            
            CGFloat scrollOff = scrollView.contentOffset.y - advertisementCell.frame.origin.y + sself->_tableView.bounds.size.height - advertisementModel.height ;
            
            CGPoint contentOffset = CGPointZero;
            
            if (maxOff <= scrollOff) {
                
                contentOffset = CGPointZero;
                
            }else if (scrollOff < 0){
                
                contentOffset = CGPointMake(0,maxOff);

            } else{
                
                contentOffset = CGPointMake(0,(maxOff - scrollOff));
            }
            
            advertisementCell.contentOffset = contentOffset;
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
