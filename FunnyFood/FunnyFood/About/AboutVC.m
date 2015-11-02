//
//  AboutVC.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC ()
@property(nonatomic, strong) UITextView *textView;
@end

@implementation AboutVC{
//    UITextView *textView;
    NSTimer *tvTimer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.bounds];
    background.image = [UIImage imageNamed:@"wall.png"];
    [self.view addSubview:background];
    
    [self addTextView];
}

-(void)addTextView{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, self.view.bounds.size.width - 40, self.view.bounds.size.height - 300)];
    
    self.textView.text = @"\n\n\n\n\n   Nhà hàng bánh ngọt Funny Food  khai trương ngày 20 tháng 10 vừa qua hứa hẹn trở thành một điểm đến lý thú cho những ai yêu thích văn hóa ẩm thực Pháp.\n\n   Đến với Funny Food thực khách không chỉ được thưởng thức các món bánh với hương vị Pháp tuyệt hảo mà còn được tận mắt chứng kiến không gian thưởng thức mang đậm phong cách của nước Pháp hoa lệ và trang nhã.\n\n    Funny Food có đủ chủng loại bánh Gato, bánh mì, bánh bỏ lò, pizza, café, fastfood… do các chuyên gia đến từ Pháp đảm nhiệm chế biến.";
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.font = [UIFont fontWithName:@"Helvetica" size:17];
    self.textView.textColor = [UIColor blueColor];
    
    if (tvTimer == nil) {
        tvTimer = [NSTimer scheduledTimerWithTimeInterval:50.0/1000.0
                                                   target:self
                                                 selector:@selector(onScrollTextView)
                                                 userInfo:nil
                                                  repeats:YES];
    }
    [self.view addSubview:self.textView];
}

-(void)viewDidDisappear:(BOOL)animated{
    [tvTimer invalidate];
    tvTimer = nil;
}

-(void)onScrollTextView{
    CGPoint point = self.textView.contentOffset;
    point = CGPointMake(point.x, point.y + 1);
//    NSLog(@"%@", NSStringFromCGPoint(point));
    if (point.y > 400) {
        point = CGPointMake(point.x, -300);
    }
    [self.textView setContentOffset:point animated:NO];
}

@end
