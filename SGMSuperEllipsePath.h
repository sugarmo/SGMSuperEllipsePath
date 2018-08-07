//
//  SGMSuperEllipsePath.h
//  Curvature
//
//  Created by Steven Mok on 2018/8/7.
//  Copyright © 2018 SUGARMO. All rights reserved.
//
//  Based on: https://github.com/everdrone/react-native-super-ellipse-mask

#import <UIKit/UIKit.h>

typedef struct {
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomRight;
    CGFloat bottomLeft;
} SGMSuperEllipseCornerComponents;

@interface UIBezierPath (SGMSuperEllipsePathAdditions)

+ (UIBezierPath *)sgm_superEllipsePathWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;

+ (UIBezierPath *)sgm_superEllipsePathWithRect:(CGRect)rect cornerComponents:(SGMSuperEllipseCornerComponents)components;

@end
