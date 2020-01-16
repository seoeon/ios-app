//
//  TableViewCell.h
//  EX1
//
//  Created by Study on 2020/01/15.
//  Copyright © 2020 Study. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *contents;

@end

NS_ASSUME_NONNULL_END
