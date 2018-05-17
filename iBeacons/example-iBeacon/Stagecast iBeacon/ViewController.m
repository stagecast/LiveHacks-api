//
//  ViewController.m
//  Stagecast iBeacon
//
//  Created by Joakim Rasmuson on 2017-03-24.
//  Copyright © 2017 Stagecast. All rights reserved.
//

#import "ViewController.h"
#import "MapView.h"
#import <KontaktSDK/KontaktSDK.h>

@interface BeaconData : NSObject

@property NSString *identifier;
@property CGPoint position;
@property CGFloat accuracy;

@end

@implementation BeaconData

+ (id)dataWithIdentifier:(NSString*)identifier andPosition:(CGPoint)position {
    
    BeaconData *beaconData = [[BeaconData alloc] init];
    beaconData.identifier = identifier;
    beaconData.position = position;
    beaconData.accuracy = 0;
    
    return beaconData;
}

@end

@interface ViewController () <KTKBeaconManagerDelegate>

@property (retain, nonatomic) IBOutlet MapView *mapView;
@property (retain, nonatomic) IBOutlet UITextView *textViewInfo;

@property KTKBeaconManager *beaconManager;
@property BeaconData *beaconMarkus;
@property BeaconData *beaconDaniel;
@property BeaconData *beaconMagnus;

@property bool isRunning;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.beaconManager = [[KTKBeaconManager alloc] initWithDelegate:self];
    
    CGFloat v0 = M_PI / 6.0, v1 = 5.0 * M_PI / 6.0, v2 = 3.0 * M_PI / 2.0;
    _beaconMarkus = [BeaconData dataWithIdentifier:@"Markus" andPosition:CGPointMake(cosf(v0), sinf(v0))];
    _beaconDaniel = [BeaconData dataWithIdentifier:@"Daniel" andPosition:CGPointMake(cosf(v1), sinf(v1))];
    _beaconMagnus = [BeaconData dataWithIdentifier:@"Magnus" andPosition:CGPointMake(cosf(v2), sinf(v2))];
    
//    _beaconMarkus.position = CGPointMake(0, 0), _beaconMarkus.accuracy = 0.1;
//    _beaconDaniel.position = CGPointMake(1, 0), _beaconDaniel.accuracy = 0.1;
//    _beaconMagnus.position = CGPointMake(1, 2), _beaconMagnus.accuracy = 1;
//    CGPoint point = [self trilateration];
//    NSLog(@"(%.2f, %.2f)", point.x, point.y);
    
    _mapView.devicePos = _mapView.closestBeaconPos = CGPointMake(-2, -2);
    _mapView.beaconMarkusPos = _beaconMarkus.position;
    _mapView.beaconDanielPos = _beaconDaniel.position;
    _mapView.beaconMagnusPos = _beaconMagnus.position;
    
    [_mapView setNeedsDisplay];
    
    _isRunning = NO;
    
    switch ([KTKBeaconManager locationAuthorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            [self.beaconManager requestLocationAlwaysAuthorization];
            break;
            
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            // No access to Location Services
            [self printMessage:@"I need location services to work!"];
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            // For most iBeacon-based app this type of
            // permission is not adequate
            [self printMessage:@"I need location services to work!"];
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
            // We will use this later
            [self run];
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)run {
    
    if (_isRunning)
        return;
    
    NSUUID *myProximityUUID = [[NSUUID alloc] initWithUUIDString:@"f7826da6-4fa2-4e98-8024-bc5b71e0893e"];
    
    KTKBeaconRegion *regionMarkus = [[KTKBeaconRegion alloc] initWithProximityUUID:myProximityUUID major:0 minor:2 identifier:_beaconMarkus.identifier];
    KTKBeaconRegion *regionDaniel = [[KTKBeaconRegion alloc] initWithProximityUUID:myProximityUUID major:0 minor:1 identifier:_beaconDaniel.identifier];
    KTKBeaconRegion *regionMagnus = [[KTKBeaconRegion alloc] initWithProximityUUID:myProximityUUID major:0 minor:0 identifier:_beaconMagnus.identifier];

    if ([KTKBeaconManager isMonitoringAvailable]) {
        [self.beaconManager startMonitoringForRegion:regionMarkus];
        [self.beaconManager startMonitoringForRegion:regionDaniel];
        [self.beaconManager startMonitoringForRegion:regionMagnus];
    }
    
    [_beaconManager startRangingBeaconsInRegion:regionMarkus];
    [_beaconManager startRangingBeaconsInRegion:regionDaniel];
    [_beaconManager startRangingBeaconsInRegion:regionMagnus];
    
    [self printMessage:@"We are running!"];
    _isRunning = YES;
}


- (void)printMessage:(NSString*)message {
    
    _textViewInfo.text = [NSString stringWithFormat:@"%@\n%@", message, _textViewInfo.text];
}


- (void)beaconManager:(KTKBeaconManager *)manager didStartMonitoringForRegion:(__kindof KTKBeaconRegion *)region {
    // Do something when monitoring for a particular
    // region is successfully initiated
    
    [self printMessage:[NSString stringWithFormat:@"Did start monitoring for region: %@", region.identifier]];
}


- (void)beaconManager:(KTKBeaconManager *)manager didRangeBeacons:(nonnull NSArray<CLBeacon *> *)beacons inRegion:(nonnull __kindof KTKBeaconRegion *)region {
    // Do something when one or more beacons were ranged
    
    for (int i = 0; i < beacons.count; i ++) {
        CLBeacon *beacon = beacons[i];
        
        if ([region.identifier isEqualToString:_beaconMarkus.identifier])
            _beaconMarkus.accuracy = beacon.accuracy;
        if ([region.identifier isEqualToString:_beaconDaniel.identifier])
            _beaconDaniel.accuracy = beacon.accuracy;
        if ([region.identifier isEqualToString:_beaconMagnus.identifier])
            _beaconMagnus.accuracy = beacon.accuracy;
        
        [self printMessage:[NSString stringWithFormat:@"%@: \t%.2f m", region.identifier, beacon.accuracy]];
        
        self.mapView.devicePos = [self trilateration];
        self.mapView.closestBeaconPos = [self closestBeacon].position;
        [self.mapView setNeedsDisplay];
    }
    
    [self trilateration];
}


- (void)beaconManager:(KTKBeaconManager *)manager monitoringDidFailForRegion:(__kindof KTKBeaconRegion *)region withError:(NSError *)error {
    // Handle monitoring failing to start for your region
    
    [self printMessage:[NSString stringWithFormat:@"Monitoring did fail for region: %@", region.identifier]];
}


- (void)beaconManager:(KTKBeaconManager *)manager didEnterRegion:(__kindof KTKBeaconRegion *)region {
    // Decide what to do when a user enters a range of your region; usually used
    // for triggering a local notification and/or starting a beacon ranging
    
    [self printMessage:[NSString stringWithFormat:@"Did enter region: %@", region.identifier]];
}


- (void)beaconManager:(KTKBeaconManager *)manager didExitRegion:(__kindof KTKBeaconRegion *)region {
    // Decide what to do when a user exits a range of your region; usually used
    // for triggering a local notification and stoping a beacon ranging
    
    [self printMessage:[NSString stringWithFormat:@"Did exit region: %@", region.identifier]];
}


- (void)beaconManager:(KTKBeaconManager *)manager didChangeLocationAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways) {
        // When status changes to kCLAuthorizationStatusAuthorizedAlways
        // e.g. after calling [self.beaconManager requestLocationAlwaysAuthorization]
        // we can start region monitoring from here
        
        [self run];
    }
}


#pragma mark - Utilities

- (CGPoint)trilateration {
    
    // Home-made trilateration:
    BeaconData *a = _beaconMarkus, *b = _beaconDaniel, *c = _beaconMagnus;
    
    CGFloat accA = (a.accuracy >= 0.0) ? a.accuracy : 100.0;
    CGFloat accB = (b.accuracy >= 0.0) ? b.accuracy : 100.0;
    CGFloat accC = (c.accuracy >= 0.0) ? c.accuracy : 100.0;
    
    CGFloat multiplierA = 1.0 / accA;
    CGFloat multiplierB = 1.0 / accB;
    CGFloat multiplierC = 1.0 / accC;
    CGFloat totalMultiplier = multiplierA + multiplierB + multiplierC;
    multiplierA /= totalMultiplier;
    multiplierB /= totalMultiplier;
    multiplierC /= totalMultiplier;
    
    GLKVector2 A = GLKVector2Make(a.position.x, a.position.y);
    GLKVector2 B = GLKVector2Make(b.position.x, b.position.y);
    GLKVector2 C = GLKVector2Make(c.position.x, c.position.y);
    GLKVector2 D = GLKVector2DivideScalar(GLKVector2Add(A, GLKVector2Add(B, C)), 3); // Center point.
    
    GLKVector2 DA = GLKVector2Subtract(A, D);
    GLKVector2 DB = GLKVector2Subtract(B, D);
    GLKVector2 DC = GLKVector2Subtract(C, D);
    
    D = GLKVector2Add(D, GLKVector2MultiplyScalar(DA, multiplierA));
    D = GLKVector2Add(D, GLKVector2MultiplyScalar(DB, multiplierB));
    D = GLKVector2Add(D, GLKVector2MultiplyScalar(DC, multiplierC));
    
    return CGPointMake(D.x, D.y);
    
    
    // Proper trilateration, that doesn't seem to work very well:
//    BeaconData *a = _beaconMarkus, *b = _beaconDaniel, *c = _beaconMagnus;
//    
//    CGFloat xa = a.position.x, ya = a.position.y, ra = a.accuracy;
//    CGFloat xb = b.position.x, yb = b.position.y, rb = b.accuracy;
//    CGFloat xc = c.position.x, yc = c.position.y, rc = c.accuracy;
//    
//    
//    CGFloat S = (powf(xc, 2) - powf(xb, 2) + powf(yc, 2) - powf(yb, 2) + powf(rb, 2) - powf(rc, 2)) / 2.0;
//    CGFloat T = (powf(xa, 2) - powf(xb, 2) + powf(ya, 2) - powf(yb, 2) + powf(rb, 2) - powf(ra, 2)) / 2.0;
//    CGFloat y = ((T * (xb - xc)) - (S * (xb - xa))) / (((ya - yb) * (xb - xc)) - ((yc - yb) * (xb - xa)));
//    CGFloat x = ((y * (ya - yb)) - T) / (xb - xa);
//    
//    return CGPointMake(x, y);
}


- (BeaconData*)closestBeacon {
    
    BeaconData *closest = _beaconMarkus;
    if (_beaconDaniel.accuracy < closest.accuracy)
        closest = _beaconDaniel;
    if (_beaconMagnus.accuracy < closest.accuracy)
        closest = _beaconMagnus;
    
    return closest;
}


@end
