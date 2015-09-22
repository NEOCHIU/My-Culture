//
//  CultureMapViewController.m
//  MyCulture
//
//  Created by CosenMac on 2015/8/26.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "CultureMapViewController.h"


@interface CultureMapViewController (){
    CLLocation *userLocation;
    double userMapLat;
    double userMapLon;
    MKPointAnnotation *point;
    
}

@end

@implementation CultureMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate=self;
    
    //使用者當前位置
    //_myMap.showsUserLocation = YES;
    //是否需定位權限
    [locationManager requestWhenInUseAuthorization];
    //開啟行動裝置位所在置功能
    [locationManager startUpdatingLocation];
    
   CLLocation *location = locationManager.location;
    userMapLat =location.coordinate.latitude ;
    userMapLon =location.coordinate.longitude;
    
    NSLog(@"userMapLat=%f",userMapLat);
    NSLog(@"userMapLon=%f",userMapLon);
    
    if (![CLLocationManager locationServicesEnabled]){
        NSLog(@"用戶手機定位功能沒有打開");
    }
    
    //  //加入myActivityView讀取畫面
  // _myview =  [[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 568)];
    [_myview setBackgroundColor:[UIColor blackColor]];
    [_myview setAlpha:0.5];
    _myActivityView = [[UIActivityIndicatorView alloc]
                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _myActivityView.color=[UIColor redColor];
    [_myActivityView setFrame:CGRectMake(80,100,20,20)];
//_myActivityView.center = self.view.center;
//    _myActivityView.hidesWhenStopped = YES;
    
    UILabel *mylabel = [[UILabel alloc] initWithFrame:CGRectMake(_myActivityView.frame.origin.x-50,_myActivityView.frame.origin.y-50, 160, 250)];
    mylabel.text = @"資料讀取中⋯";
    mylabel.backgroundColor = [UIColor clearColor];
    mylabel.font = [UIFont systemFontOfSize:22];
    mylabel.textColor = [UIColor whiteColor];
    [_myview addSubview:mylabel];
    [_myview addSubview:_myActivityView];
    
    //開始圈圈與畫面
    [self.view addSubview:_myview];
    [_myActivityView startAnimating];
    //GCD呈現
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        

    //讀取url 抓取現在位置以外的未過期的活動點
     NSString *urlString=[NSString stringWithFormat: @"http://cloud.culture.tw/frontsite/opendata/activityOpenDataJsonAction.do?method=doFindActivitiesNearBy&lat=%f&lon=%f&range=20&uk=7Gbd75gM",userMapLat,userMapLon];
    NSLog(@"urlString %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    //取得Json資訊
    NSArray* jsonobj = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingMutableContainers
                                                         error:nil];
    //初始化Listobj物件
    _ListObj = [[NSMutableArray alloc]init];
    
    //迭代出NSArray裡面的所有值，轉成物件後，存放到NSMutableArray裡面
    [jsonobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        NSDictionary* jsonArray = [jsonobj objectAtIndex:idx];
        NSLog(@"mapArray:%@",jsonArray);
        CutMapObject *product = [[CutMapObject alloc] initWithDictionary:jsonArray error:nil];
        [_ListObj addObject:product];
         NSLog(@"mapArrayListObj:%@",_ListObj);
    }];
   dispatch_async(dispatch_get_main_queue(), ^{  
   //for 迴圈抓point
    for (int i=1; i<_ListObj.count; i++) {
    
    CutMapObject *cutMapObject = [_ListObj objectAtIndex:i];
    CutMapInfoObject  *cutMapInfoObject = cutMapObject.showInfo[0];
    point = [[MKPointAnnotation alloc]init];
        
    NSString *strlat = cutMapInfoObject.latitude;
    NSString *strlon = cutMapInfoObject.longitude;
        
    double latitude =[strlat doubleValue];
    double longitude =[strlon doubleValue];
    NSLog(@"addlatitude %f",latitude);
     NSLog(@"addlongitude %f",longitude);
        
    point.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        
    //接著就可以用物件屬性的方式來操作物件
    point.title = cutMapInfoObject.locationName;
    [self.myMap addAnnotation:point];

    }
       //結束圈圈與畫面
       [_myview removeFromSuperview];
       [_myActivityView stopAnimating];
    
   });
});
    
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
   
    if (!userLocation) {
        userLocation = [locations lastObject];
    
    //地圖中心
   CLLocationCoordinate2D mapCenter = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    
   //地圖跨度
    
    CLLocationDegrees letDelta = 0.05;
    CLLocationDegrees longDelt = 0.05;
    MKCoordinateSpan span = MKCoordinateSpanMake(letDelta, longDelt);
    
   //地圖顯示區域
    MKCoordinateRegion region = MKCoordinateRegionMake(mapCenter, span);
    
    //設定顯示的區域
    [self.myMap setRegion:region animated:YES];
    
    //顯示使用者位置
    [self.myMap setShowsUserLocation:YES];
    
    //讓地圖隋用者移動;
    [self.myMap setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
        
    }
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [locationManager stopUpdatingLocation];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
