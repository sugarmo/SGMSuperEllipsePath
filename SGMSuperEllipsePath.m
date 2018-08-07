//
//  SGMSuperEllipsePath.m
//  Curvature
//
//  Created by Steven Mok on 2018/8/7.
//  Copyright © 2018 SUGARMO. All rights reserved.
//
//  Based on: https://github.com/everdrone/react-native-super-ellipse-mask

#import "SGMSuperEllipsePath.h"

const CGFloat SGMSuperEllipseCoeff = 1.28195;

@implementation UIBezierPath (SGMSuperEllipsePathAdditions)

+ (UIBezierPath *)sgm_superEllipsePathWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
    SGMSuperEllipseCornerComponents components;
    components.topLeft = cornerRadius;
    components.topRight = cornerRadius;
    components.bottomLeft = cornerRadius;
    components.bottomRight = cornerRadius;
    return [self sgm_superEllipsePathWithRect:rect cornerComponents:components];
}

+ (UIBezierPath *)sgm_superEllipsePathWithRect:(CGRect)rect cornerComponents:(SGMSuperEllipseCornerComponents)components
{
    components = [self sgm_superEllipseCornerComponentsForRect:rect cornerComponents:components];
    CGFloat coeff = SGMSuperEllipseCoeff;

    UIBezierPath *path = [[UIBezierPath alloc] init];

    CGPoint last = CGPointMake(rect.size.width, rect.origin.y);
    // edit path
    [path moveToPoint:CGPointMake(rect.origin.x + components.topLeft * coeff, last.y)];

    // top
    [path addLineToPoint:CGPointMake(last.x - components.topRight * coeff, last.y)];

    last = CGPointMake(last.x - components.topRight * coeff, last.y);
    // top right c1
    [path addCurveToPoint:CGPointMake(last.x + components.topRight * 0.77037, last.y + components.topRight * 0.13357)
            controlPoint1:CGPointMake(last.x + components.topRight * 0.44576, last.y)
            controlPoint2:CGPointMake(last.x + components.topRight * 0.6074, last.y + components.topRight * 0.04641)];
    // top right c2
    last = CGPointMake(last.x + components.topRight * 0.77037, last.y + components.topRight * 0.13357);
    [path addCurveToPoint:CGPointMake(last.x + components.topRight * 0.37801, last.y + components.topRight * 0.37801)
            controlPoint1:CGPointMake(last.x + components.topRight * 0.16296, last.y + components.topRight * 0.08715)
            controlPoint2:CGPointMake(last.x + components.topRight * 0.290086, last.y + components.topRight * 0.2150)];
    // top right c3
    last = CGPointMake(last.x + components.topRight * 0.37801, last.y + components.topRight * 0.37801);
    [path addCurveToPoint:CGPointMake(last.x + components.topRight * 0.13357, last.y + components.topRight * 0.77037)
            controlPoint1:CGPointMake(last.x + components.topRight * 0.08715, last.y + components.topRight * 0.16296)
            controlPoint2:CGPointMake(last.x + components.topRight * 0.13357, last.y + components.topRight * 0.32461)];

    last = CGPointMake(rect.size.width, rect.size.height);
    // right
    [path addLineToPoint:CGPointMake(last.x, last.y - components.bottomRight * coeff)];

    last = CGPointMake(last.x, last.y - components.bottomRight * coeff);
    // bottom right c1
    [path addCurveToPoint:CGPointMake(last.x - components.bottomRight * 0.13357, last.y + components.bottomRight * 0.77037)
            controlPoint1:CGPointMake(last.x, last.y + components.bottomRight * 0.44576)
            controlPoint2:CGPointMake(last.x - components.bottomRight * 0.04641, last.y + components.bottomRight * 0.6074)];
    // bottom right c2
    last = CGPointMake(last.x - components.bottomRight * 0.13357, last.y + components.bottomRight * 0.77037);
    [path addCurveToPoint:CGPointMake(last.x - components.bottomRight * 0.37801, last.y + components.bottomRight * 0.37801)
            controlPoint1:CGPointMake(last.x - components.bottomRight * 0.08715, last.y + components.bottomRight * 0.16296)
            controlPoint2:CGPointMake(last.x - components.bottomRight * 0.21505, last.y + components.bottomRight * 0.290086)];
    // bottom right c3
    last = CGPointMake(last.x - components.bottomRight * 0.37801, last.y + components.bottomRight * 0.37801);
    [path addCurveToPoint:CGPointMake(last.x - components.bottomRight * 0.77037, last.y + components.bottomRight * 0.13357)
            controlPoint1:CGPointMake(last.x - components.bottomRight * 0.16296, last.y + components.bottomRight * 0.08715)
            controlPoint2:CGPointMake(last.x - components.bottomRight * 0.32461, last.y + components.bottomRight * 0.13357)];

    last = CGPointMake(rect.origin.x, rect.size.height);
    // bottom
    [path addLineToPoint:CGPointMake(last.x + components.bottomLeft * coeff, last.y)];

    last = CGPointMake(last.x + components.bottomLeft * coeff, last.y);
    // bottom left c1
    [path addCurveToPoint:CGPointMake(last.x - components.bottomLeft * 0.77037, last.y - components.bottomLeft * 0.13357)
            controlPoint1:CGPointMake(last.x - components.bottomLeft * 0.44576, last.y)
            controlPoint2:CGPointMake(last.x - components.bottomLeft * 0.6074, last.y - components.bottomLeft * 0.04641)];
    // bottom left c2
    last = CGPointMake(last.x - components.bottomLeft * 0.77037, last.y - components.bottomLeft * 0.13357);
    [path addCurveToPoint:CGPointMake(last.x - components.bottomLeft * 0.37801, last.y - components.bottomLeft * 0.37801)
            controlPoint1:CGPointMake(last.x - components.bottomLeft * 0.16296, last.y - components.bottomLeft * 0.08715)
            controlPoint2:CGPointMake(last.x - components.bottomLeft * 0.290086, last.y - components.bottomLeft * 0.2150)];
    // bottom left c3
    last = CGPointMake(last.x - components.bottomLeft * 0.37801, last.y - components.bottomLeft * 0.37801);
    [path addCurveToPoint:CGPointMake(last.x - components.bottomLeft * 0.13357, last.y - components.bottomLeft * 0.77037)
            controlPoint1:CGPointMake(last.x - components.bottomLeft * 0.08715, last.y - components.bottomLeft * 0.16296)
            controlPoint2:CGPointMake(last.x - components.bottomLeft * 0.13357, last.y - components.bottomLeft * 0.32461)];

    // left
    [path addLineToPoint:CGPointMake(rect.origin.x, rect.origin.y + components.topLeft * coeff)];

    last = CGPointMake(rect.origin.x, rect.origin.y + components.topLeft * coeff);
    // top left c1
    [path addCurveToPoint:CGPointMake(last.x + components.topLeft * 0.13357, last.y - components.topLeft * 0.77037)
            controlPoint1:CGPointMake(last.x, last.y - components.topLeft * 0.44576)
            controlPoint2:CGPointMake(last.x + components.topLeft * 0.04641, last.y - components.topLeft * 0.6074)];
    // top left c2
    last = CGPointMake(last.x + components.topLeft * 0.13357, last.y - components.topLeft * 0.77037);
    [path addCurveToPoint:CGPointMake(last.x + components.topLeft * 0.37801, last.y - components.topLeft * 0.37801)
            controlPoint1:CGPointMake(last.x + components.topLeft * 0.08715, last.y - components.topLeft * 0.16296)
            controlPoint2:CGPointMake(last.x + components.topLeft * 0.21505, last.y - components.topLeft * 0.290086)];
    // top left c3
    last = CGPointMake(last.x + components.topLeft * 0.37801, last.y - components.topLeft * 0.37801);
    [path addCurveToPoint:CGPointMake(last.x + components.topLeft * 0.77037, last.y - components.topLeft * 0.13357)
            controlPoint1:CGPointMake(last.x + components.topLeft * 0.16296, last.y - components.topLeft * 0.08715)
            controlPoint2:CGPointMake(last.x + components.topLeft * 0.32461, last.y - components.topLeft * 0.13357)];

    [path closePath];

    return path;
}

+ (SGMSuperEllipseCornerComponents)sgm_superEllipseCornerComponentsForRect:(CGRect)rect cornerComponents:(SGMSuperEllipseCornerComponents)components
{
    CGFloat coeff = SGMSuperEllipseCoeff;

    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;

    CGFloat mTopLeft = components.topLeft * coeff;
    CGFloat mTopRight = components.topRight * coeff;
    CGFloat mBottomRight = components.bottomRight * coeff;
    CGFloat mBottomLeft = components.bottomLeft * coeff;

    CGFloat shorter;
    CGFloat x;

    // topRight
    shorter = MIN(w, h);
    x = mTopRight;
    x = x > shorter ? shorter : x;
    components.topRight = x / coeff;

    // bottomRight
    shorter = MIN(w, h - x);
    x = mBottomRight;
    x = x > shorter ? shorter : x;
    components.bottomRight = x / coeff;

    // bottomLeft
    shorter = MIN(w - x, h);
    x = mBottomLeft;
    x = x > shorter ? shorter : x;
    components.bottomLeft = x / coeff;

    // topLeft
    shorter = MIN(w - components.topRight * coeff, h - x);
    x = mTopLeft;
    x = x > shorter ? shorter : x;
    components.topLeft = x / coeff;

    return components;
}

@end
