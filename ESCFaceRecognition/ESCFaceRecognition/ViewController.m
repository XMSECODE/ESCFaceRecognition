//
//  ViewController.m
//  ESCFaceRecognition
//
//  Created by xiangmingsheng on 06/01/2018.
//  Copyright © 2018 XMSECODE. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+FaceRecognize.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"test1"];
    
    [self dect];
}

- (void)dect {
    
    UIImage *image1 = [UIImage imageNamed:@"test"];
    [image1 recognizeFaceAndMark:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
}

@end
