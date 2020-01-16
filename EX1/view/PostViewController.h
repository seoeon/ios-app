//
//  PostViewController.h
//  EX1
//
//  Created by Study on 2020/01/16.
//  Copyright © 2020 Study. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostViewController : UIViewController<UIImagePickerControllerDelegate>
- (IBAction)backOnClick:(id)sender;
- (IBAction)saveOnClick:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UITextView *mainTitle;
@property (weak, nonatomic) IBOutlet UITextView *mainContents;
- (IBAction)selectImgs:(id)sender;
-(UIImage *) resize:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
