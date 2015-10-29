//
//  DataItem.h
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataItem : NSObject
@property(nonatomic,assign) NSString *name;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,assign) NSString *price;
@property(nonatomic,assign) NSString *sale;


-(instancetype)initWithName:(NSString*)name image:(NSString*)image price:(NSString*)price sale:(NSString*)sale;
@end
