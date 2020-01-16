//
//  MainViewController.h
//  EX1
//
//  Created by Study on 2020/01/15.
//  Copyright © 2020 Study. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
- (IBAction)compose:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
