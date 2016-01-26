//
//  DetailScreenTVC.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "DetailScreenTVC.h"
#import "CustomCell.h"
#import "ContentVC.h"

@interface DetailScreenTVC ()

@end

@implementation DetailScreenTVC{
    NSMutableArray *arrayCoffee;
    NSMutableArray *arrayTea;
    NSMutableArray *arrayFruit;
    NSMutableArray *arrayWine;
    NSMutableArray *arrayCola;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.title = @"Menu";
    if (_isSaleOff) {
        self.title = @"Sale Off";
    }
    [self createDataWithTitle:self.stringTitleGroup];
}

-(void)createDataWithTitle:(NSString*)title{
    if ([title isEqualToString:@"coffee"]) {
        [self createDataCoffee];
    }else if ([title isEqualToString:@"tea"]) {
        [self createDataCoffee];
    }else if ([title isEqualToString:@"fruit"]) {
        [self createDataCoffee];
    }else if ([title isEqualToString:@"wine"]) {
        [self createDataCoffee];
    }else if ([title isEqualToString:@"cola"]) {
        [self createDataCoffee];
    }
    
    if (_isSaleOff) {
        for (int i = 0; i < arrayCoffee.count; i++) {
            DataItem *item = arrayCoffee[i];
            if ([item.sale isEqualToString:@""]) {
                [arrayCoffee removeObjectAtIndex:i];
                i--;
            }
        }
    }
}

-(void)createDataCoffee{
    DataItem *item1 = [[DataItem alloc] initWithName:@"Cà phê trứng" image:@"cafetrung.jpg" price:@"$12" sale:@"-20%"];
    DataItem *item2 = [[DataItem alloc] initWithName:@"Chanh đào ngâm mật ong" image:@"chanhdaongammatong.jpg" price:@"$20" sale:@""];
    DataItem *item3 = [[DataItem alloc] initWithName:@"Chè bưởi" image:@"chebuoi.jpg" price:@"$17" sale:@""];
    DataItem *item4 = [[DataItem alloc] initWithName:@"Chè trân châu" image:@"chetranchau.jpg" price:@"$11" sale:@"free"];
    DataItem *item5 = [[DataItem alloc] initWithName:@"Cocktail chanh mật ong" image:@"cocktailchanhmatong.jpg" price:@"$12" sale:@""];
    DataItem *item6 = [[DataItem alloc] initWithName:@"Dưa bở dầm đường" image:@"duabodamduong.jpg" price:@"$19" sale:@""];
    DataItem *item7 = [[DataItem alloc] initWithName:@"Kem dưa bở" image:@"kemduabo.jpg" price:@"$21" sale:@"-10%"];
    DataItem *item8 = [[DataItem alloc] initWithName:@"Latte trà xanh" image:@"lattetraxanh.jpg" price:@"$13" sale:@"-15%"];
    DataItem *item9 = [[DataItem alloc] initWithName:@"Mango passion" image:@"mangopassion.jpg" price:@"$7" sale:@""];
    DataItem *item10 = [[DataItem alloc] initWithName:@"Mận ngâm đường" image:@"manngamduong.jpg" price:@"$9" sale:@"free"];
    DataItem *item11 = [[DataItem alloc] initWithName:@"Nước chanh mật ong" image:@"nuocchanhmatong.jpg" price:@"$12" sale:@""];
    DataItem *item12 = [[DataItem alloc] initWithName:@"Nước chanh muối" image:@"nuocchanhmuoi.jpg" price:@"$22" sale:@""];
    DataItem *item13 = [[DataItem alloc] initWithName:@"Nước dâu tằm" image:@"nuocdautam.jpg" price:@"$5" sale:@"-15%"];
    DataItem *item14 = [[DataItem alloc] initWithName:@"Nước dưa leo bạc hà" image:@"nuocdualeobacha.jpg" price:@"$11" sale:@""];
    DataItem *item15 = [[DataItem alloc] initWithName:@"Nước ép cần tây, táo" image:@"nuocepcantaytao.jpg" price:@"$19" sale:@""];
    DataItem *item16 = [[DataItem alloc] initWithName:@"Nước ép dưa leo" image:@"nuocepdualeo.jpg" price:@"$6" sale:@"-25%"];
    DataItem *item17 = [[DataItem alloc] initWithName:@"Nước mát rễ tranh, mía lau" image:@"nuocmatretranhmialau.jpg" price:@"$18" sale:@""];
    DataItem *item18 = [[DataItem alloc] initWithName:@"Nước mát sương sáu hạt é" image:@"nuocmatsuongsauhate.jpg" price:@"$20" sale:@""];
    DataItem *item19 = [[DataItem alloc] initWithName:@"Nước mía lau đường phèn" image:@"nuocmialauduongphen.jpg" price:@"$15" sale:@"-10%"];
    DataItem *item20 = [[DataItem alloc] initWithName:@"Nước mơ" image:@"nuocmo.jpg" price:@"$12" sale:@""];
    
    arrayCoffee = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, nil];
}

-(void)createDataTea{
    
}

-(void)createDataFruit{
    
}

-(void)createDataWine{
    
}

-(void)createDataCola{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayCoffee.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil].firstObject;
//    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setData:arrayCoffee[indexPath.row]];
    return cell;
}

#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContentVC *contentVC = [ContentVC new];
    [contentVC setContent:arrayCoffee[indexPath.row]];
    
    if(_isSaleOff){
        contentVC.isSaleOff = YES;
    }
    
    [self.navigationController pushViewController:contentVC animated:YES];
}

@end
