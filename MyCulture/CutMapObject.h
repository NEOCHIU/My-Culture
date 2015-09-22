//
//  CutMapObject.h
//  MyCulture
//
//  Created by kid chiu on 2015/9/5.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "JSONModel.h"
#import "CutMapInfoObject.h"

@interface CutMapObject : JSONModel

@property (nonatomic) NSString *title;
@property (strong, nonatomic) NSArray<CutMapInfoObject,ConvertOnDemand> *showInfo;

@end
