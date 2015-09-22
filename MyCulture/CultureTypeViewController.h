//
//  CultureTypeViewController.h
//  MyCulture
//
//  Created by kid chiu on 2015/8/29.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatTypeObject.h"
#import"CatTypeInfoObject.h"

@interface CultureTypeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSString *catTypeCode;
}
@property (nonatomic, retain) NSString *catTypeCode;


//動態陣列用來存放Json物件集合
@property (nonatomic)NSMutableArray *ListObj;
@property (nonatomic)NSMutableArray *ListInfoObj;

//UITableView的IBoutlet
@property (weak, nonatomic) IBOutlet UITableView *table;


@end
