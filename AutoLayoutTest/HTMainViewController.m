//
//  HTMainViewController.m
//  AutoLayoutTest
//
//  Created by Jason on 2014/9/1.
//  Copyright (c) 2014年 HappyMan. All rights reserved.
//

#import "HTMainViewController.h"

@interface HTMainViewController ()

@end

@implementation HTMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self imageAutoLayout];

    [self viewAutoLayout];
}

-(void)imageAutoLayout
{
    UIImageView *happyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"happyman.jpeg"]];
    [happyImageView setAlpha:0.7];
    [self.view addSubview:happyImageView];
    
    // 設定中心點（多餘）
    happyImageView.center = CGPointMake(100, 100);
    
    // 記得關閉Auto Resizing Mask，否則限制條件無法作用
    [happyImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    // 與superview的底部往上移動150個單位高度（不能小於）
    NSLayoutConstraint *myConstraint;
    myConstraint = [NSLayoutConstraint constraintWithItem:happyImageView attribute:NSLayoutAttributeBottom
                                                relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                   toItem:[happyImageView superview] attribute:NSLayoutAttributeBottom
                                               multiplier:1.0f constant:-150.0f];
    [self.view addConstraint:myConstraint];
    
    // x軸對齊superview的x軸中心點往左移動50個單位長度
    myConstraint = [NSLayoutConstraint constraintWithItem:happyImageView attribute:NSLayoutAttributeCenterX
                                                relatedBy:NSLayoutRelationEqual
                                                   toItem:[happyImageView superview] attribute:NSLayoutAttributeCenterX
                                               multiplier:1.0f constant:-50.0f];
    [self.view addConstraint:myConstraint];
    
    // 寬度限制，100個單位
    myConstraint = [NSLayoutConstraint constraintWithItem:happyImageView attribute:NSLayoutAttributeWidth
                                                relatedBy:NSLayoutRelationEqual
                                                   toItem:nil attribute:NSLayoutAttributeNotAnAttribute
                                               multiplier:1.0f constant:100.0f];
    [self.view addConstraint:myConstraint];
    
    // 高度限制，100個單位
    myConstraint = [NSLayoutConstraint constraintWithItem:happyImageView attribute:NSLayoutAttributeHeight
                                                relatedBy:NSLayoutRelationEqual
                                                   toItem:nil attribute:NSLayoutAttributeNotAnAttribute
                                               multiplier:1.0f constant:100.0f];
    [self.view addConstraint:myConstraint];
}

-(void)viewAutoLayout
{
    UIView *ViewA = [[UIView alloc]init];
    ViewA.backgroundColor = [UIColor greenColor];
    [ViewA setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:ViewA];
    
    UIView *ViewB = [[UIView alloc]init];
    ViewB.backgroundColor = [UIColor blueColor];
    [ViewB setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view  addSubview:ViewB];
    
    
    NSMutableArray *myConstraints = [NSMutableArray array];
    
    // 從水平方向佈局
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[ViewA(100)]-10-[ViewB(>=100)]-|"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(ViewA,ViewB)]];
    
    
    // 從垂直方向佈局
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ViewA(100)]-|"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(ViewA)]];
    
    // 從垂直方向佈局
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ViewB(ViewA)]-|"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(ViewB,ViewA)]];
    
    [self.view addConstraints:myConstraints];
}
@end
