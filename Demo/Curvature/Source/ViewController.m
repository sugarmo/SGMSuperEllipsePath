//
//  ViewController.m
//  Curvature
//
//  Created by Steven Mok on 2018/8/6.
//  Copyright © 2018 SUGARMO. All rights reserved.
//

#import "ViewController.h"
#import "RounedCornerView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RounedCornerView *rounedCornerView;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSwitcher;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.rounedCornerView.cornerRadius = [self currentCornerRadius];
    self.rounedCornerView.mode = [self currentCornerMode];
}

- (CGFloat)currentCornerRadius
{
    return 100 * self.radiusSlider.value;
}

- (RounedCornerMode)currentCornerMode
{
    return self.modeSwitcher.selectedSegmentIndex;
}

- (IBAction)adjustRadius:(UISlider *)sender
{
    self.rounedCornerView.cornerRadius = [self currentCornerRadius];
}

- (IBAction)toggleSuperEllipse:(UISegmentedControl *)sender
{
    self.rounedCornerView.mode = [self currentCornerMode];
}

@end
