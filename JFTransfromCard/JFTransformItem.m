//
//  JFTransformItem.m
//  testForFlowLayout
//
//  Created by 五维科技 on 16/1/22.
//  Copyright © 2016年 五维科技. All rights reserved.
//

#import "JFTransformItem.h"

#define pNormalScale 0.8//最小的缩放比例

#define pMaxScale 1.0//最大的拉伸比例

@implementation JFTransformItem

- (void)awakeFromNib {
    
    self.backView.clipsToBounds = NO;
    
    self.contentView.clipsToBounds = NO;
    
    self.clipsToBounds = NO;
    
    self.backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    
    self.backView.layer.shadowOpacity = 0.6;
    
    self.backView.layer.shadowOffset = CGSizeMake(1, 1);
    
    self.backView.transform = CGAffineTransformMakeScale(pNormalScale,pNormalScale);
    
//    self.distanceButton.enabled = NO;
    
//    UIColor*color = [UIColor colorWithRed:245.0/255 green:150.0/255 blue:27.0/255 alpha:1];
    
    self.bottomBack.backgroundColor = [UIColor colorWithRed:245.0/255 green:150.0/255 blue:27.0/255 alpha:1];
    
    self.distanceButton.layer.cornerRadius = 5.0;
    
    self.distanceButton.layer.masksToBounds = YES;
    
    self.distanceButton.backgroundColor = [UIColor colorWithRed:245.0/255 green:150.0/255 blue:27.0/255 alpha:.7];
    
}
-(void)transformSubViewsWithFrame:(CGRect)frame
{
    
    CGFloat preferXoffset = pStableXoffset;//距离collectionView左边间距为此值时视图恢复正常大小
    
    CGFloat itemGaps = 0.0;//item的间距
    
    CGFloat itemXoffset = frame.origin.x;
    
    CGFloat animationMinOffset = -(frame.size.width - (preferXoffset-frame.size.width/2-itemGaps));//item子视图开始动画的最小x偏移量
    
    CGFloat animationMaxOffset = preferXoffset + frame.size.width/2 + itemGaps;//item子视图开始动画的最大x偏移量
    
    CGFloat normalOffset = preferXoffset - frame.size.width/2;//item子视图为1倍大小时的x方向偏移量
    
    CGFloat needScale = 0;
    
    if (itemXoffset > animationMinOffset && itemXoffset < animationMaxOffset) {
        
        if (itemXoffset<normalOffset) {//开始缩小
            
            CGFloat config = normalOffset - animationMinOffset;
            
            needScale =(itemXoffset-animationMinOffset)/config*(pMaxScale-pNormalScale)+pNormalScale;
            
        }else if (itemXoffset>normalOffset){//开始缩小
            
            CGFloat config = animationMaxOffset - normalOffset;
            
            needScale =(animationMaxOffset-itemXoffset)/config*(pMaxScale-pNormalScale)+pNormalScale;
            
        }else{//恢复正常(最大)
            
            needScale = pMaxScale;
            
        }
        
    }else{
        
        needScale = pNormalScale;
        
    }
    
    self.backView.transform = CGAffineTransformMakeScale(needScale,needScale);
    
    CGRect subViewframe = self.backView.frame;
    
    CGFloat bottomGaps = 8.0;
    
    subViewframe.origin.y = pTranItemDefaultHeight-subViewframe.size.height-bottomGaps;
    
    self.backView.frame=subViewframe;
    
}

@end
