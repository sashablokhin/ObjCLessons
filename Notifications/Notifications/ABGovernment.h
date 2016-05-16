//
//  ABGovernment.h
//  Notifications
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const ABGovernmentTaxLevelDidChangeNotification;
extern NSString *const ABGovernmentSalaryDidChangeNotification;
extern NSString *const ABGovernmentPensionDidChangeNotification;
extern NSString *const ABGovernmentAveragePriceDidChangeNotification;

extern NSString *const ABGovernmentTaxLevelUserInfoKey;
extern NSString *const ABGovernmentSalaryUserInfoKey;
extern NSString *const ABGovernmentPensionUserInfoKey;
extern NSString *const ABGovernmentAveragePriceUserInfoKey;

@interface ABGovernment : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float averagePrice;

@end
