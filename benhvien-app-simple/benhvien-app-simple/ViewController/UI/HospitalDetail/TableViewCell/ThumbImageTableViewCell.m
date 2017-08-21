//
//  ThumbImageTableViewCell.m
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ThumbImageTableViewCell.h"

@implementation ThumbImageTableViewCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setupSlideShow];
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupSlideShow {
    _dataSource = @[[NSURL URLWithString:@"http://lorempixel.com/200/200/city/"], [NSURL URLWithString:@"http://lorempixel.com/200/200/city/"]];
    
    _slideShow.datasource = self;
    _slideShow.delegate = self;
    [_slideShow setDelay:3]; // Delay between transitions
    [_slideShow setTransitionDuration:1]; // Transition duration
    [_slideShow setTransitionType:KASlideShowTransitionFade]; // Choose a transition type
    [_slideShow setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [_slideShow addGesture:KASlideShowGestureTap]; // Gesture to go previous/next directly on the image
}

#pragma mark - KASlideShow datasource

- (NSObject *)slideShow:(KASlideShow *)slideShow objectAtIndex:(NSUInteger)index
{
    return _dataSource[index];
}

- (NSUInteger)slideShowImagesNumber:(KASlideShow *)slideShow
{
    return _dataSource.count;
}

#pragma mark - KASlideShow delegate

- (void) slideShowWillShowNext:(KASlideShow *)slideShow
{
    NSLog(@"slideShowWillShowNext, index : %@",@(slideShow.currentIndex));
}

@end
