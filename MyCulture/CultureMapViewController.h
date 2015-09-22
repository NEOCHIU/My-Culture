//
//  CultureMapViewController.h
//  MyCulture
//
//  Created by CosenMac on 2015/8/26.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "CoreLocation/CoreLocation.h"
#import "CutMapObject.h"

@interface CultureMapViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    
}

@property (weak, nonatomic) IBOutlet UIView *myview;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *myActivityView;
@property (weak, nonatomic) IBOutlet MKMapView *myMap;
//動態陣列用來存放Json物件集合
@property (nonatomic)NSMutableArray *ListObj;

@end
