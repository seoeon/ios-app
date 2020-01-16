//
//  DetailViewController.h
//  EX1
//
//  Created by Study on 2020/01/16.
//  Copyright © 2020 Study. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
- (IBAction)backOnClick:(id)sender;
- (void)initWithTCI:(NSDictionary*)tci;
@property (weak, nonatomic) IBOutlet UIImageView *DetailViewImage;
@property (weak, nonatomic) IBOutlet UITextView *DetailViewTitle;
@property (weak, nonatomic) IBOutlet UITextView *DetailViewContents;

@end

NS_ASSUME_NONNULL_END
