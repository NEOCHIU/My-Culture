//
//  CatTypeInfoObject.h
//  MyCulture
//
//  Created by kid chiu on 2015/8/30.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "JSONModel.h"
@protocol CatTypeInfoObject
@end

@interface CatTypeInfoObject : JSONModel
@property (nonatomic) NSString *time;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *locationName;
@property (nonatomic) NSString *onSales;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *endTime;
@end
