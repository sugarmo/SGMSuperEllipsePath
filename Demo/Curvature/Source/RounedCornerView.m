//
//  ContinuousCurvatureView.m
//  Curvature
//
//  Created by Steven Mok on 2018/8/6.
//  Copyright © 2018 SUGARMO. All rights reserved.
//

#import "RounedCornerView.h"
#import "SGMSuperEllipsePath.h"

@interface RounedCornerView ()

@property (nonatomic) CAShapeLayer *maskLayer;

@end

@implementation RounedCornerView

- (void)dealloc
{
    self.layer.mask = nil;
}

- (void)commonInit
{
    _maskLayer = [[CAShapeLayer alloc] init];
    _maskLayer.frame = self.frame;
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    self.layer.mask = _maskLayer;

    self.layer.opaque = false;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self commonInit];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self commonInit];
    }

    return self;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;

        [self setNeedsLayout];
    }
}

- (void)setMode:(RounedCornerMode)mode
{
    if (_mode != mode) {
        _mode = mode;

        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.maskLayer.frame = self.layer.bounds;

    switch (self.mode) {
        case RounedCornerModeUIKit: {
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.maskLayer.bounds cornerRadius:self.cornerRadius];
            self.maskLayer.path = path.CGPath;
            break;
        }

        case RounedCornerModeCoreGraphics: {
            CGPathRef path = CGPathCreateWithRoundedRect(self.maskLayer.bounds, self.cornerRadius, self.cornerRadius, NULL);
            self.maskLayer.path = path;
            CGPathRelease(path);
            break;
        }

        case RounedCornerModeCustom: {
            UIBezierPath *path = [UIBezierPath sgm_superEllipsePathWithRect:self.maskLayer.bounds cornerRadius:self.cornerRadius];
            self.maskLayer.path = path.CGPath;
            break;
        }

        default:
            break;
    }
}

@end
