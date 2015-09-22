//
//  CutMapInfoObject.h
//  MyCulture
//
//  Created by kid chiu on 2015/9/5.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "JSONModel.h"
@protocol CutMapInfoObject
@end

@interface CutMapInfoObject : JSONModel
@property (nonatomic) NSString *latitude;//緯度
@property (nonatomic) NSString *longitude;//經度
@property (nonatomic) NSString *locationName;//地點名稱
@end
