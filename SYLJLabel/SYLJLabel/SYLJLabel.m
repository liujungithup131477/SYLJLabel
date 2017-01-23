//
//  SYLJLabel.m
//  SYLJLabel
//
//  Created by 刘俊 on 2017/1/23.
//  Copyright © 2017年 刘俊. All rights reserved.
//

#import "SYLJLabel.h"

@interface SYLJLabel ()

/** 文本内容 - 可变属性字符串的子类 */
@property (nonatomic, strong) NSTextStorage *textStorage;
/** 布局管理器 - 负责文本绘制 */
@property (nonatomic, strong) NSLayoutManager *layoutManager;
/** 文本容器 - 设置绘制的尺寸 */
@property (nonatomic, strong) NSTextContainer *textContainer;

@end

@implementation SYLJLabel

#pragma mark - override properties
@synthesize text = _text;
- (void)setText:(NSString *)text
{
    _text = text;
    
    [self updateTextStorage];
}

@synthesize attributedText = _attributedText;
- (void)setAttributedText:(NSAttributedString *)attributedText
{
    _attributedText = attributedText;
    
    [self updateTextStorage];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self prepareTextSystem];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self prepareTextSystem];
    }
    return self;
}

- (void)updateTextStorage
{
    if (self.text != nil) {
        [self.textStorage setAttributedString:[[NSAttributedString alloc] initWithString:self.text]];
    } else if (self.attributedText != nil) {
        [self.textStorage setAttributedString:self.attributedText];
    } else {
        [self.textStorage setAttributedString:[[NSAttributedString alloc] initWithString:@""]];
    }
    
}

#pragma mark - 绘制文本
- (void)drawTextInRect:(CGRect)rect
{
    NSRange range = NSMakeRange(0, self.textStorage.length);
    // 绘制字形 － 布局管理器绘制 textStorage 中的内容
    [self.layoutManager drawGlyphsForGlyphRange:range atPoint:CGPointZero];
}

/// 准备文本系统
- (void)prepareTextSystem
{
    [self.textStorage addLayoutManager:self.layoutManager];
    [self.layoutManager addTextContainer:self.textContainer];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置文本容器的尺寸
    self.textContainer.size = self.bounds.size;
}

#pragma mark - lazy properties
- (NSTextStorage *)textStorage
{
    if (_textStorage == nil) {
        _textStorage = [[NSTextStorage alloc] init];
    }
    return _textStorage;
}

- (NSLayoutManager *)layoutManager
{
    if (_layoutManager == nil) {
        _layoutManager = [[NSLayoutManager alloc] init];
    }
    return _layoutManager;
}

- (NSTextContainer *)textContainer
{
    if (_textContainer == nil) {
        _textContainer = [[NSTextContainer alloc] init];
    }
    return _textContainer;
}

@end
