//
//  CustomLabelView.m
//  customLabel
//
//  Created by 灵智创优001 on 17/5/26.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import "CustomLabelView.h"
static int lineNumbers ;//换行次数
static int selectIndex ;//当前选中的ButtonTag值

#define BTAG       2017527
#define LabelSpace 15
#define SpaceTop   100
#define SWIDTH [UIScreen mainScreen].bounds.size.width
#define SHEIGHT [UIScreen mainScreen].bounds.size.height
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0x00FF00) >>8))/255.0 blue:((s &0x0000FF))/255.0 alpha:1.0]

@interface CustomLabelView ()

@property(nonatomic, assign ) BOOL isSelectMore;
@property(nonatomic, strong ) NSMutableArray *selectIndexs;//选中的标签
@property(nonatomic, strong ) NSMutableArray *selectTitls;//选中的标签

@property(nonatomic, strong ) NSArray *labelTitles;//标签内容

@end

@implementation CustomLabelView

- (instancetype)initWithTitles:(NSArray *)titles isSelectMore:(BOOL)isSelectMore {
    
    if (self = [super init]) {
       
        if (titles.count > 0) {
            
            _isSelectMore = isSelectMore;
            
            _labelTitles = [NSArray arrayWithArray:titles];
            
            _selectTitls = [NSMutableArray arrayWithCapacity:0];
            _selectIndexs = [NSMutableArray arrayWithCapacity:0];
            
            CGFloat Current_H  = SpaceTop ;
            
            CGFloat Current_W  = 0.f ;
            
            for (int i = 0 ; i < titles.count; i++) {
                
                CGFloat LabelWidth = [titles[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.width + 20;
                
                if (Current_W + LabelWidth > SWIDTH) {
                    
                    Current_W = 0;
                    
                    Current_H = SpaceTop + 30*(lineNumbers +1);
                    
                    lineNumbers += 1;
                    
                }
                
                Current_W += LabelSpace  ;
                
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                
                button.backgroundColor = UIColorFromHex(0xF8F8F8);
                button.tag = BTAG + i ;
                button.frame = CGRectMake(Current_W, Current_H, LabelWidth, 18);
                
                [button setTitle:titles[i] forState:UIControlStateNormal];
                
                [button setTitleColor:UIColorFromHex(0x969696) forState:UIControlStateNormal];
                
                button.titleLabel.font = [UIFont systemFontOfSize:13];
                Current_W = CGRectGetMaxX(button.frame);
                
                button.clipsToBounds = YES;
                
                button.layer.cornerRadius = 3;
                
                [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
                
                [self addSubview:button];
                
            }
   
        
        }
        
    }
    
    return self;
    
}

- (void)clickBtn:(UIButton*)selectButton{
    
    if (_isSelectMore) {

         selectIndex = (int)selectButton.tag - BTAG ;
        
        if ([_selectIndexs containsObject:@(selectIndex)]) {
            
            selectButton.backgroundColor = UIColorFromHex(0xF8F8F8);
            
            [_selectIndexs removeObject:@(selectIndex)];
            [_selectTitls removeObject:_labelTitles[selectIndex]];
            
            
        }else{
            
            selectButton.backgroundColor = [UIColor yellowColor];
            
            [_selectIndexs addObject:@(selectIndex)];
            [_selectTitls addObject:_labelTitles[selectIndex]];
            
        }
    
        if (self.ReturnSelectLabelTitles) {
            
            self.ReturnSelectLabelTitles(_selectTitls);
            
        }
       
        
    }else{
        
        UIButton * button = [self viewWithTag:selectIndex];
        
        button.backgroundColor = UIColorFromHex(0xF8F8F8);
        
        selectIndex = selectIndex == selectButton.tag ? 0 : (int)selectButton.tag ;
        
        if (selectIndex > 0) {
            
            if (self.ReturnSelectLabelTitles) {
                
                self.ReturnSelectLabelTitles(@[selectButton.titleLabel.text]);
                
            }
            
        }
        
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
