//
//  ContentVC.m
//  FunnyFood
//
//  Created by TaiND on 10/30/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "ContentVC.h"

@interface ContentVC ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contraintHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contraintWidth;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelSale;
@property (strong, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation ContentVC {
    CGSize mainSize;
    DataItem *itemContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"Detail drink";
    if (_isSaleOff) {
        self.title = @"Detail sale off";
    }
    
    mainSize = CGSizeMake(self.view.bounds.size.width - 36, self.view.bounds.size.height - 16);
    
    self.imgView.image = itemContent.image;
    self.labelPrice.text = itemContent.price;
    self.labelSale.text = itemContent.sale;
    self.labelName.text = itemContent.name;
    
    if (![_labelSale.text isEqualToString:@""]) {
        [self setAnimationSale];
    }
    [self setContraint];
}

-(void)setIsSaleOff:(BOOL)isSaleOff{
    _isSaleOff = isSaleOff;
}

-(void)setAnimationSale{
    [UIView animateWithDuration:0.5 animations:^{
        _labelSale.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            _labelSale.alpha = 0;
        } completion:^(BOOL finished) {
            [self setAnimationSale];
        }];
    }];
}

-(void)setContraint{
    CGSize size = itemContent.image.size;
    CGFloat newWidth;
    CGFloat newHeight;
    if (size.height <= mainSize.height && size.width <= mainSize.width) {
        newHeight = size.height;
        newWidth = size.width;
    }else if (size.width > mainSize.width){
        newWidth = size.width*(mainSize.width/size.width);
        newHeight = size.height*(mainSize.width/size.width);
        if (newHeight > mainSize.height) {
            newHeight = mainSize.height;
            newWidth = newHeight*(size.width/size.height);
        }
    }else if (size.height > mainSize.height){
        newHeight = size.height*(mainSize.height/size.height);
        newWidth = size.width*(mainSize.height/size.height);
        if (newWidth > mainSize.width) {
            newWidth = mainSize.width;
            newHeight = newWidth*(size.height/size.width);
        }
    }
    
    self.contraintHeight.constant = newHeight;
    self.contraintWidth.constant = newWidth;
}

-(void)setContent:(DataItem*)item{
    itemContent = [DataItem new];
    itemContent = item;
}

@end
