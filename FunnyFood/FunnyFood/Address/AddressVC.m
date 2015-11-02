//
//  AddressVC.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "AddressVC.h"
#import "DetailAddress.h"

@interface AddressVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation AddressVC{
    UITableView *myTableView;
    NSArray *shop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    NSDictionary *shop1 = @{@"shop":@"Shop 1", @"location":@"255, Nguyễn Khang", @"phone":@"01649635055", @"map": @"255NK.png"};
    NSDictionary *shop2 = @{@"shop":@"Shop 2", @"location":@"36, Cầu Giấy", @"phone":@"01662677433", @"map": @"36CG.png"};
    shop= @[shop1, shop2];
    
    myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.dataSource = self;
    myTableView.delegate = self;
    myTableView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    [self.view addSubview:myTableView];
}

#pragma mark - Table View Datasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    NSDictionary *item = shop[indexPath.row];
    cell.textLabel.text = [item objectForKey:@"shop"];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:25];
    
    cell.detailTextLabel.text = [item objectForKey:@"location"];
    cell.detailTextLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:17];
    
    cell.imageView.image = [UIImage imageNamed:@"location_ic2"];
//    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return shop.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailAddress *detailAddress = [DetailAddress new];
    detailAddress.item = shop[indexPath.row];
    [self.navigationController pushViewController:detailAddress animated:YES];
}

@end
