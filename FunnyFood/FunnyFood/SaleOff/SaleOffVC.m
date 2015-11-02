//
//  SaleOffVC.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "SaleOffVC.h"
#import "MainScreenVC.h"

@interface SaleOffVC ()

@end

@implementation SaleOffVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    MainScreenVC *saleScreen = [MainScreenVC new];
    saleScreen.isSaleOff = YES;
    [self.navigationController pushViewController:saleScreen animated:NO];
}

@end
