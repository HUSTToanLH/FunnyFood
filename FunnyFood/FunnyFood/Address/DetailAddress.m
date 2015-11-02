//
//  DetailAddress.m
//  FunnyFood
//
//  Created by TaiND on 10/30/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "DetailAddress.h"

#define size_zoom 1.5

@interface DetailAddress ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelLocation;
@property (strong, nonatomic) IBOutlet UILabel *labelPhone;
@property (nonatomic, strong) UIImageView *photo;

@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end

@implementation DetailAddress{
//    UIScrollView *scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [_item objectForKey:@"shop"];
    _labelLocation.text = [_item objectForKey:@"location"];
    _labelPhone.text = [_item objectForKey:@"phone"];
    
    [self addMapToScrollView];
    [self.mainScrollView zoomToRect:CGRectMake(112.66666666666667, 39.555555555555543, 111.11111111111111, 134.22222222222223) animated:YES];
}

-(void)setItem:(NSDictionary *)item{
    _item = item;
}

- (void) addMapToScrollView {
//    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.labelPhone.center.y + 30, self.view.bounds.size.width, self.view.bounds.size.height - self.labelPhone.center.y - 30)];
    self.mainScrollView.delegate = self;
    self.mainScrollView.minimumZoomScale = 0.2;
    self.mainScrollView.maximumZoomScale = 10;
    self.mainScrollView.zoomScale = 1;
    self.mainScrollView.clipsToBounds = YES;
    
    
    self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.mainScrollView.bounds.size.height)];
    self.photo.image = [UIImage imageNamed:[_item objectForKey:@"map"]];
    self.photo.contentMode = UIViewContentModeScaleAspectFill;
    
    self.photo.userInteractionEnabled = YES;
    self.photo.multipleTouchEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    
    [self.photo addGestureRecognizer:singleTap];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onDoubleTap:)];
    
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delegate = self;
    [self.photo addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    [self.mainScrollView addSubview:self.photo];
//    [self.view addSubview:scrollView];
//    self.mainScrollView = scrollView;
}

- (void) onTap: (UITapGestureRecognizer*) tap {
    
    CGPoint tapPoint = [tap locationInView:self.photo];
    
    float newScale = self.mainScrollView.zoomScale * size_zoom;
    
    [self zoomRectForScale:newScale
                withCenter:tapPoint];
}
- (void) onDoubleTap: (UITapGestureRecognizer*) tap {
    CGPoint tapPoint = [tap locationInView:self.photo];
    
    float newScale = self.mainScrollView.zoomScale / size_zoom;
    
    [self zoomRectForScale:newScale
                withCenter:tapPoint];
}
- (void) zoomRectForScale: (float) scale
               withCenter: (CGPoint) center {
    
    CGRect zoomRect;
    CGSize scrollViewSize = self.mainScrollView.bounds.size;
    
    zoomRect.size.width = scrollViewSize.width / scale;
    zoomRect.size.height = scrollViewSize.height / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2);
    
//    NSLog(@"%@", NSStringFromCGRect(zoomRect));
    [self.mainScrollView zoomToRect:zoomRect animated:YES];
}
- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.photo;
}

@end
