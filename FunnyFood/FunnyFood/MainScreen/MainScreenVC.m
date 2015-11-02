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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    if (_isSaleOff) {
        self.title = @"Sale Off";
        self.navigationItem.hidesBackButton = YES;
    }
    
    [self setCornerGroupButton];
    
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"Chia team.xlsx"]];
    QZWorkbook *excelReader = [[QZWorkbook alloc] initWithContentsOfXLS:url];
    QZWorkSheet *firstWorkSheet = excelReader.workSheets.firstObject;
    [firstWorkSheet open];
    
    NSLog(@"test: %@", firstWorkSheet.rows.firstObject);
}

-(void)setCornerGroupButton{
    width = 60;
    UIEdgeInsets inset = UIEdgeInsetsMake(width/10, width/10, width/10, width/10);
    
    [[self.buttonCoffee imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [_buttonCoffee setImage:[UIImage imageNamed:@"cafe_active"] forState:UIControlStateNormal];
    _buttonCoffee.contentEdgeInsets = inset;
    _buttonCoffee.layer.cornerRadius = width/2;
    
    [[self.buttonTea imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [_buttonTea setImage:[UIImage imageNamed:@"tea_active"] forState:UIControlStateNormal];
    _buttonTea.contentEdgeInsets = inset;
    _buttonTea.layer.cornerRadius = width/2;
    
    [[self.buttonFruit imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [_buttonFruit setImage:[UIImage imageNamed:@"fruit_active"] forState:UIControlStateNormal];
    _buttonFruit.contentEdgeInsets = inset;
    _buttonFruit.layer.cornerRadius = width/2;
    
    [[self.buttonWine imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [_buttonWine setImage:[UIImage imageNamed:@"wine_active"] forState:UIControlStateNormal];
    _buttonWine.contentEdgeInsets = inset;
    _buttonWine.layer.cornerRadius = width/2;
    
    [[self.buttonCola imageView] setContentMode: UIViewContentModeScaleAspectFit];
    [_buttonCola setImage:[UIImage imageNamed:@"cola_active"] forState:UIControlStateNormal];
    _buttonCola.contentEdgeInsets = inset;
    _buttonCola.layer.cornerRadius = width/2;
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
