//
//  PostViewController.m
//  EX1
//
//  Created by Study on 2020/01/16.
//  Copyright © 2020 Study. All rights reserved.
//

#import "PostViewController.h"
#import "RestClient.h"

@interface PostViewController (){
    UIImagePickerController *imagePicker;
    RestClient* client;
}
@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = (id)self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    client = [[RestClient alloc]init];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    [self.mainImage setImage:info[UIImagePickerControllerOriginalImage]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backOnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveOnClick:(id)sender {
    
    
    NSData *imageData = UIImagePNGRepresentation([self resize:self.mainImage.image]);
    
    [client post:[self.mainTitle text] with:[self.mainContents text] with:[imageData base64EncodedStringWithOptions:kNilOptions]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)selectImgs:(id)sender {
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(UIImage *) resize:(UIImage *)image {
    CGFloat newWidth = image.size.width, newHeight = image.size.height;
    if(image.size.width >= 512){
        newHeight = newHeight / newWidth * 512;
        newWidth = 512;
    }
    if(newHeight >= 384){
        newWidth = newWidth / newHeight * 384;
        newHeight = 384;
    }
    CGRect rect = CGRectMake(0, 0, newWidth, newHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *rimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rimage;
}
@end
