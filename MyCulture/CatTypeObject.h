//
//  catTypeObject.h
//  MyCulture
//
//  Created by kid chiu on 2015/8/29.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "JSONModel.h"
#import"CatTypeInfoObject.h"

@interface CatTypeObject : JSONModel


@property (nonatomic) NSString *title;
@property (nonatomic) NSString *startDate;
@property (nonatomic) NSString *discountInfo;
@property (nonatomic) NSString *sourceWebPromote;
@property (nonatomic) NSString *webSales;
@property (nonatomic) NSString *sourceWebName;
@property (nonatomic) NSString *endDate;
@property (strong, nonatomic) NSMutableArray<CatTypeInfoObject,ConvertOnDemand> *showInfo;


@end
