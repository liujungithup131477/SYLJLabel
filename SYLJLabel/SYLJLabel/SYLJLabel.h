//
//  SYLJLabel.h
//  SYLJLabel
//
//  Created by 刘俊 on 2017/1/23.
//  Copyright © 2017年 刘俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SYLJLabelDelegate;

@interface SYLJLabel : UILabel

/** 链接内容的颜色 */
@property (nonatomic, strong) UIColor *linkTextColor;

@property (nonatomic, strong) UIColor *selectedBackgroudColor;

@property (nonatomic, weak) SYLJLabel *labelDelegate;

@end

@protocol SYLJLabelDelegate <NSObject>

- (void)labelDidSelectedLinkTextWithLabel:(SYLJLabel *)label text:(NSString *)text;

@end
