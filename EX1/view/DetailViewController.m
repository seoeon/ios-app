//
//  DetailViewController.m
//  EX1
//
//  Created by Study on 2020/01/16.
//  Copyright © 2020 Study. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)initWithTCI:(NSDictionary*)tci {
    NSString* base64String = [NSString stringWithFormat:@"%@%@", @"data:image/png;base64,",[tci objectForKey:@"img"]];
    UIImage* image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:base64String]]];
    
    [_DetailViewImage setImage:image];
    [_DetailViewTitle setText:[tci objectForKey:@"title"]];
    [_DetailViewContents setText:[tci objectForKey:@"contents"]];
}
@end
