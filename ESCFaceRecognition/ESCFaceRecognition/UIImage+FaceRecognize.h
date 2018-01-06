//
//  UIImage+FaceRecognize.h
//  ESCFaceRecognition
//
//  Created by xiangmingsheng on 06/01/2018.
//  Copyright © 2018 XMSECODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FaceRecognize)

- (UIImage *)recognizeFaceAndMark;

- (void)recognizeFaceAndMark:(void(^)(UIImage *image))complete;

@end
