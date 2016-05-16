//
//  ABGovernment.m
//  Notifications
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABGovernment.h"

// Один объект говорит о своем состоянии нескольким другим объектам через NSNotificationCenter (в случае с делегатом - несколько объектов говорят о своем состоянии одному объекту делегату)

NSString *const ABGovernmentTaxLevelDidChangeNotification = @"ABGovernmentTaxLevelDidChangeNotification";
NSString *const ABGovernmentSalaryDidChangeNotification = @"ABGovernmentSalaryDidChangeNotification";
NSString *const ABGovernmentPensionDidChangeNotification = @"ABGovernmentPensionDidChangeNotification";
NSString *const ABGovernmentAveragePriceDidChangeNotification = @"ABGovernmentAveragePriceDidChangeNotification";

NSString *const ABGovernmentTaxLevelUserInfoKey = @"ABGovernmentTaxLevelUserInfoKey";
NSString *const ABGovernmentSalaryUserInfoKey = @"ABGovernmentSalaryUserInfoKey";
NSString *const ABGovernmentPensionUserInfoKey = @"ABGovernmentPensionUserInfoKey";
NSString *const ABGovernmentAveragePriceUserInfoKey = @"ABGovernmentAveragePriceUserInfoKey";

@implementation ABGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 1000;
        self.pension = 500;
        self.averagePrice = 10;
    }
    return self;
}

- (void)setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary *dictionary = @{ABGovernmentTaxLevelUserInfoKey : @(taxLevel)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ABGovernmentTaxLevelDidChangeNotification object:nil userInfo:dictionary];
}

- (void)setSalary:(float)salary {
    _salary = salary;
    
    NSDictionary *dictionary = @{ABGovernmentSalaryUserInfoKey : @(salary)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ABGovernmentSalaryDidChangeNotification object:nil userInfo:dictionary];
}

- (void)setPension:(float)pension {
    _pension = pension;
    
    NSDictionary *dictionary = @{ABGovernmentPensionUserInfoKey : @(pension)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ABGovernmentPensionDidChangeNotification object:nil userInfo:dictionary];
}

- (void)setAveragePrice:(float)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = @{ABGovernmentAveragePriceUserInfoKey : @(averagePrice)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ABGovernmentAveragePriceDidChangeNotification object:nil userInfo:dictionary];
}

@end









