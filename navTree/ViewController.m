//
//  ViewController.m
//  navTree
//
//  Created by PatrickY on 2018/3/20.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "CitiesViewController.h"


@interface ViewController ()

@property (nonatomic, strong) NSArray                           *listData;
@property (nonatomic, strong) NSDictionary                      *dictData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellidentifier];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinces_cities" ofType:@"plist"];
    self.dictData = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.listData = [self.dictData allKeys];
    
    self.title = @"省份";
    
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listData.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellidentifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    NSInteger row = indexPath.row;
    cell.textLabel.text = self.listData[row];
    
    return cell;
    
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CitiesViewController *citiesViewController = [[CitiesViewController alloc] initWithStyle:UITableViewStylePlain];
    
    NSInteger selectedIdx = indexPath.row;
    NSString *selectedName = self.listData[selectedIdx];
    citiesViewController.listData = self.dictData[selectedName];
    citiesViewController.title = selectedName;
    
    
    [self.navigationController pushViewController:citiesViewController animated:YES];
    
}


@end
