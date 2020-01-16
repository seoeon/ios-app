//
//  MainViewController.m
//  EX1
//
//  Created by Study on 2020/01/15.
//  Copyright © 2020 Study. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewCell.h"
#import "../rest/RestClient.h"
#import "DetailViewController.h"
#import "PostViewController.h"

@interface MainViewController (){
    NSMutableArray* data;
    RestClient *client;
    NSDate* requestStart;
    NSTimeInterval elaptedTime;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    data = [[NSMutableArray alloc] init];
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 2)];
    footerView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.0f];
    self.tableView.tableFooterView = footerView;
    
    client = [[RestClient alloc] init];
    [self addDataByIndex:0];
    requestStart = [NSDate date];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120.0f;
}
    
    
-(void)scrollViewDidScroll:(UITableView *)tableView {
    
    CGFloat height = tableView.frame.size.height;
    CGFloat contentYOffset = tableView.contentOffset.y;
    CGFloat distanceFromBottom = tableView.contentSize.height - contentYOffset;
    
    if(distanceFromBottom < height){
        elaptedTime = -[requestStart timeIntervalSinceNow];
        [self tryRequest];
    }
}

- (void)tryRequest {
    if(elaptedTime > 3){
        [self addDataByIndex:[data count]];
        NSLog(@"loading");
        requestStart = [NSDate date];
    }else{
        NSLog(@"not load");
        return;
    }
}

- (TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *tableViewIdentifier = @"tableViewIdentifier";
    NSInteger index = indexPath.row;
    
    TableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if(!tableCell) {
        tableCell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    NSDictionary* targetData = [data objectAtIndex:index];
    
    NSString* base64String = [NSString stringWithFormat:@"%@%@", @"data:image/png;base64,",[targetData objectForKey:@"img"]];
    
    
    
    UIImage* image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:base64String]]];
    
    
    
    CGRect rect = CGRectMake(0, 0, 109, 69);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *rimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [tableCell.imgView setImage:rimage];
    [tableCell.title setText:[targetData objectForKey:@"title"]];
    [tableCell.contents setText:[targetData objectForKey:@"contents"]];
    
    return tableCell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)compose:(id)sender {
    PostViewController* postViewController =
    [[PostViewController alloc] initWithNibName:@"PostViewController" bundle:nil];
    //postViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:postViewController animated:YES completion:nil];
    
}

- (void) addDataByIndex:(NSInteger)index{
  client = [[RestClient alloc] init];
    [client get:index with:^(NSArray * _Nonnull array){
        [self -> data addObjectsFromArray:array];
        
        dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
        });
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *tci = [data objectAtIndex:indexPath.row];
    
    DetailViewController *detailviewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    //detailviewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:detailviewController animated:YES completion:nil];
    [detailviewController initWithTCI:tci];
    
}
@end
