//
//  HTSecondViewController.m
//  AutoLayoutTest
//
//  Created by Jason on 2014/9/2.
//  Copyright (c) 2014年 HappyMan. All rights reserved.
//

#import "HTSecondViewController.h"

@interface HTSecondViewController ()

@end

@implementation HTSecondViewController

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
}

//- (void)viewWillLayoutSubviews
//{
//    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
//    {
//        CGRect rect = self.topLeftView.frame;
//        rect.size.width = 254;
//        rect.size.height = 130;
//        self.topLeftView.frame = rect;
//        
//        rect = self.topRightView.frame;
//        rect.origin.x = 294;
//        rect.size.width = 254;
//        rect.size.height = 130;
//        self.topRightView.frame = rect;
//        
//        rect = self.bottomView.frame;
//        rect.origin.y = 170;
//        rect.size.width = 528;
//        rect.size.height = 130;
//        self.bottomView.frame = rect;
//    }
//    else
//    {
//        CGRect rect = self.topLeftView.frame;
//        rect.size.width = 130;
//        rect.size.height = 254;
//        self.topLeftView.frame = rect;
//        
//        rect = self.topRightView.frame;
//        rect.origin.x = 170;
//        rect.size.width = 130;
//        rect.size.height = 254;
//        self.topRightView.frame = rect;
//        
//        rect = self.bottomView.frame;
//        rect.origin.y = 295;
//        rect.size.width = 280;
//        rect.size.height = 254;
//        self.bottomView.frame = rect;
//    }
//}
@end
