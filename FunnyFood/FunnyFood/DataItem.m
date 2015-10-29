//
//  DataItem.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "DataItem.h"

@implementation DataItem
-(instancetype)initWithName:(NSString*)name image:(NSString*)image price:(NSString*)price sale:(NSString*)sale{
    if (self == [super init]) {
        self.name = name;
        self.image = [UIImage imageNamed:image];
        self.price = price;
        self.sale = sale;
    }
    return self;
}
@end
