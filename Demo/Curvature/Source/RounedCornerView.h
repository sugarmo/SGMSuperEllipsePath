//
//  ContinuousCurvatureView.h
//  Curvature
//
//  Created by Steven Mok on 2018/8/6.
//  Copyright © 2018 SUGARMO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, RounedCornerMode) {
    RounedCornerModeUIKit,
    RounedCornerModeCoreGraphics,
    RounedCornerModeCustom
};

@interface RounedCornerView : UIView

@property (nonatomic) CGFloat cornerRadius;

@property (nonatomic) RounedCornerMode mode;

@end
