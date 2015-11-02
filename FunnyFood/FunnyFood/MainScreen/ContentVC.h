//
//  ContentVC.h
//  FunnyFood
//
//  Created by TaiND on 10/30/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentVC : UIViewController
-(void)setContent:(DataItem*)item;

@property(nonatomic, assign) BOOL isSaleOff;

@end
