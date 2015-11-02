//
//  CustomCell.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelSale;

@end

@implementation CustomCell

-(void)setData:(DataItem *)item{
    _imgView.image = item.image;
    _labelName.text = item.name;
    _labelPrice.text = item.price;
    _labelSale.text = item.sale;
}

@end
