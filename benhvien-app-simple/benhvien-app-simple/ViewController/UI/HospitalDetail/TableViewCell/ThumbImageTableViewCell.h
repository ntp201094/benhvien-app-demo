//
//  ThumbImageTableViewCell.h
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLTableViewCell.h"
#import <KASlideShow/KASlideShow.h>

@interface ThumbImageTableViewCell : HLTableViewCell <KASlideShowDataSource, KASlideShowDelegate>

@property (nonatomic) NSArray *dataSource;
@property (strong, nonatomic) IBOutlet KASlideShow *slideShow;


@end
