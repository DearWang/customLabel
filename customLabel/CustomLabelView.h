//
//  CustomLabelView.h
//  customLabel
//
//  Created by 灵智创优001 on 17/5/26.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomLabelView : UIView

@property (nonatomic,copy ) void (^ReturnSelectLabelTitles)(NSArray*labelTitlesArray);
@property(nonatomic ,copy ) void (^HeightDidChange)(CGFloat viewHeight);
- (instancetype)initWithTitles:(NSArray*)titles  isSelectMore:(BOOL)isSelectMore;

@end
