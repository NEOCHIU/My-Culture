//
//  CultureCategoryViewController.h
//  MyCulture
//
//  Created by CosenMac on 2015/8/26.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatObject.h"

@interface CultureCategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) NSString *catTypeCode;

//用來序列化Json的型別
//@property (nonatomic)CatObject *info;
//動態陣列用來存放Json物件集合
@property (nonatomic)NSMutableArray *ListObj;
//UITableView的IBoutlet
@property (weak, nonatomic) IBOutlet UITableView *catTable;



@end
