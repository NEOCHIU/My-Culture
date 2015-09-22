//
//  CultureDetailViewController.h
//  MyCulture
//
//  Created by kid chiu on 2015/8/29.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatTypeObject.h"
#import "CatTypeInfoObject.h"
@interface CultureDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UILabel *onSales;
@property (weak, nonatomic) IBOutlet UILabel *sourceWebPromote;
@property (weak, nonatomic) IBOutlet UILabel *sourceWebName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *locationName;
@property (weak, nonatomic) IBOutlet UILabel *price;








@end
