//
//  WFTableViewController.m
//  MVC
//
//  Created by fly on 2017/5/11.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFTableViewController.h"
#import "WFTableViewRequestModel.h"
#import "WFTableViewShowModel.h"
#import "WFTableViewCell.h"
#import "SVProgressHUD.h"

@interface WFTableViewController ()

@property (nonatomic, strong) NSMutableArray<WFTableViewShowModel *> *dataArray; /*TableView显示时用的Array*/

@end

@implementation WFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[WFTableViewCell class]
           forCellReuseIdentifier:@"WFTableViewCell"];   /*注册cell*/
    [self wf_requestData];  /*网络请求*/
}

- (void)wf_requestData {
    [SVProgressHUD showWithStatus:@"悠闲加载中！"];
    WFTableViewRequestModel *tvrm = [[WFTableViewRequestModel alloc] init];
    [tvrm requestDataSuccess:^(NSMutableArray *dataArray){
        /*点进这个方法中看，返回的数组存储了数据模型*/
        [SVProgressHUD showSuccessWithStatus:@"请求成功！"];
        _dataArray = dataArray;
        [self.tableView reloadData];
    }
                     failure:^(NSString *errorString) {
        [SVProgressHUD showErrorWithStatus:@"请求错误，但不影响！"];
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     对于不确定高度的Cell，可以采用此方法返回一个预估的高度，
     然后使用Masonry设置约束条件即可；
     一般情况下此方法不会有问题，但是如果Cell狠狠狠狠复杂，
     可以开启一个线程提前计算Cell的高度保存起来，本Demo未采用
     */
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WFTableViewCell"
                                                            forIndexPath:indexPath];
    cell.iconURL    = _dataArray[indexPath.row].iconURL;
    cell.nameString = _dataArray[indexPath.row].userName;
    cell.textString = _dataArray[indexPath.row].text;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
