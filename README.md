UIImage-Mask
============

The best way to make a square picture into a circular one. 

## How to use

```
#import "UIImage+Mask.h"

UIImage *image = [UIImage imageNamed:@"someImage.png"];
UIImage *circleImage = [image circleImage];

```

## Why not use CALayer

You can use CALayer If you only have A view needs to be rendered.  
If there are many views (more than 20 maybe),that would be a nightmare :(  
The easit way is the best way.Just generate a circular one.  
