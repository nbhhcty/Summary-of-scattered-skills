//
//  ViewController.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ViewController.h"
#import "ExampleOnePresentingVC.h"
#import "ExampleTowPresentingVC.h"

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic, strong) NSMutableArray<NSString*>* sourceVCs;
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}

-(void)initSubViews {
    [self.view addSubview:self.tableView];
    [self initSubViewsFrame];
}

-(void)initSubViewsFrame {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64.f);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSMutableArray<NSString *> *)sourceVCs {
    if ( !_sourceVCs ) {
        _sourceVCs = [NSMutableArray new];
        [_sourceVCs addObject:@"ExampleOnePresentingVC"];
        [_sourceVCs addObject:@"ExampleTowPresentingVC"];
    }
    return _sourceVCs;
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceVCs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = _sourceVCs[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController* vc = [[NSClassFromString(_sourceVCs[indexPath.row]) alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

#pragma mark - Lazy Initial
-(UITableView *)tableView {
    if ( !_tableView ) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

@end
