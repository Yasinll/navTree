//
//  CitiesViewController.m
//  navTree
//
//  Created by PatrickY on 2018/3/20.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "CitiesViewController.h"
#import "DetailViewController.h"
NSString *const cellIdentifier = @"cellIdentifier";

@interface CitiesViewController ()

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];


}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.listData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    NSDictionary *dict = self.listData[row];
    cell.textLabel.text = dict[@"name"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

#pragma mark -- Tabel view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger selectedIdx = indexPath.row;
    NSDictionary *dict = self.listData[selectedIdx];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.urlStr = dict[@"url"];
    detailViewController.title = dict[@"name"];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
