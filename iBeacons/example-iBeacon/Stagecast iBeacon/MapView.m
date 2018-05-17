//
//  MapView.m
//  Stagecast iBeacon
//
//  Created by Joakim Rasmuson on 2017-03-31.
//  Copyright © 2017 Stagecast. All rights reserved.
//

#import "MapView.h"

@implementation MapView


- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.14 blue:0.19 alpha:1.0];
        self.strokeColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        self.fillColor = [UIColor colorWithRed:0.94 green:0.10 blue:0.29 alpha:1.0];
    }
    
    return self;
}


// Draw stuff!
- (void)drawRect:(CGRect)rect {
    
    // Scale and translate from [0,1] to pixel coordinates:
    CGPoint devicePos = [self toPixels:_devicePos inRect:rect];
    CGPoint closestBeaconPos = [self toPixels:_closestBeaconPos inRect:rect];
    CGPoint beaconMarkusPos = [self toPixels:_beaconMarkusPos inRect:rect];
    CGPoint beaconDanielPos = [self toPixels:_beaconDanielPos inRect:rect];
    CGPoint beaconMagnusPos = [self toPixels:_beaconMagnusPos inRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Clear:
    CGContextSetFillColorWithColor(ctx, _backgroundColor.CGColor);
    CGContextFillRect(ctx, rect);
    
    // Settings:
    CGContextSetStrokeColorWithColor(ctx, _strokeColor.CGColor);
    CGContextSetFillColorWithColor(ctx, _fillColor.CGColor);
    CGContextSetLineWidth(ctx, 1.5);
    
    // Put device and beacons on the map:
    [self drawLineSegmentFromA:beaconMarkusPos toB:beaconDanielPos];
    [self drawLineSegmentFromA:beaconDanielPos toB:beaconMagnusPos];
    [self drawLineSegmentFromA:beaconMagnusPos toB:beaconMarkusPos];
    
    [self drawPoint:closestBeaconPos withRadius:0.045 * rect.size.width];
    [self drawPoint:beaconMarkusPos withRadius:0.025 * rect.size.width];
    [self drawPoint:beaconDanielPos withRadius:0.025 * rect.size.width];
    [self drawPoint:beaconMagnusPos withRadius:0.025 * rect.size.width];
    [self drawPoint:devicePos withRadius:0.04 * rect.size.width];
}


// Draw a circle.
- (void)drawPoint:(CGPoint)point withRadius:(CGFloat)radius {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(point.x - radius, point.y - radius, 2.0 * radius, 2.0 * radius);
    
    CGContextFillEllipseInRect(ctx, rect);
    CGContextStrokeEllipseInRect(ctx, rect);
}

- (void)drawLineSegmentFromA:(CGPoint)a toB:(CGPoint)b {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint points[2] = {a, b};
    
    CGContextAddLines(ctx, points, 2);
    CGContextStrokePath(ctx);
}

- (CGPoint)toPixels:(CGPoint)point inRect:(CGRect)rect {
    
    CGFloat x = rect.size.width * (point.x + 1.0) / 2.0;
    CGFloat y = rect.size.width * (1.0 - point.y) / 2.0 + 0.4 * (rect.size.height - rect.size.width);
    
    return CGPointMake(x, y);
}

@end
