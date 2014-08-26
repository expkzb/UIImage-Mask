//
//  UIImage+Mask.m
//  WithTrip
//
//  Created by ZhouBin on 14-6-20.
//  Copyright (c) 2014年 Zhou Bin. All rights reserved.
//

#import "UIImage+Mask.h"

@implementation UIImage (Mask)

// mask image
- (UIImage *)circleMaskImageWithDiameter:(CGFloat)diameter {
    
    UIGraphicsBeginImageContext(CGSizeMake(diameter, diameter));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsPushContext(context);
    
    CGContextSetAllowsAntialiasing(context, YES);
    
    //填充
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, diameter, 0);
    CGContextAddLineToPoint(context, diameter, diameter);
    CGContextAddLineToPoint(context, 0, diameter);
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    
    //画圆
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(0, 0, diameter, diameter));
    
    UIGraphicsPopContext();
    
	UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
	UIGraphicsEndImageContext();
    
    return outputImage;
}

- (UIImage *)maskedImageWithMaskImage:(UIImage *)maskImage {
    CGImageRef maskRef = maskImage.CGImage;
    
	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
	CGImageRef masked = CGImageCreateWithMask([self CGImage], mask);
	return [UIImage imageWithCGImage:masked];
}


- (UIImage *)circleImage {
    
    UIImage *maskImage = [self circleMaskImageWithDiameter: self.size.width * 2];
    return [self maskedImageWithMaskImage:maskImage];
}

@end
