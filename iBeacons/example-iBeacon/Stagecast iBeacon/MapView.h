//
//  MapView.h
//  Stagecast iBeacon
//
//  Created by Joakim Rasmuson on 2017-03-31.
//  Copyright © 2017 Stagecast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface MapView : UIView

@property CGPoint devicePos;
@property CGPoint closestBeaconPos;
@property CGPoint beaconMarkusPos;
@property CGPoint beaconDanielPos;
@property CGPoint beaconMagnusPos;

@property UIColor* backgroundColor;
@property UIColor* strokeColor;
@property UIColor* fillColor;

@end
