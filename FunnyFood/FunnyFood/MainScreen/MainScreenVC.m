//
//  MainScreenVC.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "MainScreenVC.h"
#import "DetailScreenTVC.h"

@interface MainScreenVC ()
@property (strong, nonatomic) IBOutlet UIButton *buttonCoffee;
@property (strong, nonatomic) IBOutlet UIButton *buttonTea;
@property (strong, nonatomic) IBOutlet UIButton *buttonFruit;
@property (strong, nonatomic) IBOutlet UIButton *buttonWine;
@property (strong, nonatomic) IBOutlet UIButton *buttonCola;


@property(nonatomic, strong) DetailScreenTVC *detaiScreen;
@end

@implementation MainScreenVC{
    CGFloat width;
    UIEdgeInsets inset;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    if (_isSaleOff) {
        self.title = @"Sale Off";
        self.navigationItem.hidesBackButton = YES;
    }
    
    width = 60;
    inset = UIEdgeInsetsMake(width/10, width/10, width/10, width/10);
    
    [self setCornerGroupButton];
    
//    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"Chia team.xlsx"]];
//    QZWorkbook *excelReader = [[QZWorkbook alloc] initWithContentsOfXLS:url];
//    QZWorkSheet *firstWorkSheet = excelReader.workSheets.firstObject;
//    [firstWorkSheet open];
//    
//    NSLog(@"test: %@", firstWorkSheet.rows.firstObject);
    
}

-(void)setCornerGroupButton{
    
    [self setCornerButton:self.buttonCoffee imageName:@"cafe_active"];
    
    [self setCornerButton:self.buttonTea imageName:@"tea_active"];
    
    [self setCornerButton:self.buttonFruit imageName:@"fruit_active"];
    
    [self setCornerButton:self.buttonWine imageName:@"wine_active"];
    
    [self setCornerButton:self.buttonCola imageName:@"cola_active"];
}

- (void)setCornerButton:(UIButton*)button imageName:(NSString*) imageName {
    [[button imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.contentEdgeInsets = inset;
    button.layer.cornerRadius = width/2;
}

-(void)setIsSaleOff:(BOOL)isSaleOff{
    _isSaleOff = isSaleOff;
}

- (IBAction)onClickCoffee:(id)sender {
    [self pushVC:@"coffee"];
}

- (IBAction)onClickTea:(id)sender {
    [self pushVC:@"tea"];
}

- (IBAction)onClickFruit:(id)sender {
    [self pushVC:@"fruit"];
}

- (IBAction)onClickWine:(id)sender {
    [self pushVC:@"wine"];
}

- (IBAction)onClickCola:(id)sender {
    [self pushVC:@"cola"];
}

-(void)pushVC:(NSString*)title{
    if (!_detaiScreen) {
        _detaiScreen = [DetailScreenTVC new];
    }
    if (_isSaleOff) {
        self.detaiScreen.isSaleOff = YES;
    }
    self.detaiScreen.stringTitleGroup = title;
    [self.navigationController pushViewController:_detaiScreen animated:YES];
}

@end
