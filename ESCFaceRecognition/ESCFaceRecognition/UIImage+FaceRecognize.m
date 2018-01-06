//
//  UIImage+FaceRecognize.m
//  ESCFaceRecognition
//
//  Created by xiangmingsheng on 06/01/2018.
//  Copyright © 2018 XMSECODE. All rights reserved.
//

#import "UIImage+FaceRecognize.h"
#import <CoreImage/CoreImage.h>

@implementation UIImage (FaceRecognize)

- (UIImage *)recognizeFaceAndMark {
    CIImage *ciImage = [CIImage imageWithCGImage:self.CGImage];
    
    if (ciImage == nil) {
        return nil;
    }
    
    CGSize imageSize = self.size;
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    
    NSArray <CIFeature *>*faces = [detector featuresInImage:ciImage];
    
    if (faces.count > 0) {
        UIGraphicsBeginImageContext(imageSize);
        [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
        [[UIColor redColor] setStroke];
        for (CIFeature *feature in faces) {
            
            CGFloat x = feature.bounds.origin.x;
            CGFloat y = imageSize.height - feature.bounds.origin.y - feature.bounds.size.height;
            CGFloat w = feature.bounds.size.width;
            CGFloat h = feature.bounds.size.height;
            
//            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, w, h) cornerRadius:MAX(w, h) / 2];
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
            [path stroke];
            
        }
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }else {
        return self;
    }
}

- (void)recognizeFaceAndMark:(void(^)(UIImage *image))complete {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [self recognizeFaceAndMark];
        dispatch_async(dispatch_get_main_queue(), ^{
            complete(image);
        });
    });
}

@end
