//
//  UIImage+Mask.h
//  WithTrip
//
//  Created by ZhouBin on 14-6-20.
//  Copyright (c) 2014年 Zhou Bin. All rights reserved.
//  使用遮罩图片

#import <UIKit/UIKit.h>

@interface UIImage (Mask)

- (UIImage *)maskedImageWithMaskImage:(UIImage *)maskImage;

- (UIImage *)circleImage;

@end
