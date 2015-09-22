//
//  CultureDetailViewController.m
//  MyCulture
//
//  Created by kid chiu on 2015/8/29.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "CultureDetailViewController.h"
#import "AppDelegate.h"

@interface CultureDetailViewController ()

@end

@implementation CultureDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSLog(@"Detail畫面內容：%@",ad.detailedData);

  
    CatTypeObject *catObject = ad.detailedData;
    
    CatTypeInfoObject *catInfoObject = catObject.showInfo[0];
    //CatTypeInfoObject *catInfoObject = [ad.detailedData showInfo];
    
    //接著就可以用物件屬性的方式來操作物件
    _titleName.text = catObject.title;
    _startDate.text = catObject.startDate;
    _endDate.text = catObject.endDate;
    _sourceWebName.text = catObject.sourceWebName;
    _sourceWebPromote.text = catObject.sourceWebPromote;
    _onSales.text = catInfoObject.onSales;
    _time.text = catInfoObject.time;
    _location.text = catInfoObject.location;
    _locationName.text = catInfoObject.locationName;
    _price.text = catInfoObject.price;
    
    

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
