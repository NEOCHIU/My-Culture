//
//  CatObject.h
//  MyCulture
//
//  Created by kid chiu on 2015/8/26.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "JSONModel.h"
#import <Foundation/Foundation.h>

@interface CatObject : JSONModel

@property (nonatomic) NSString *categoryCode;
@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *total;

@end
