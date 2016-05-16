//
//  ABCitizen.m
//  Notifications
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABCitizen.h"
#import "ABGovernment.h"

@implementation ABCitizen

#pragma mark Initialize

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self listen];
    }
    return self;
}

- (void)listen {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(governmentNotification:) name:ABGovernmentTaxLevelDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(salaryChangeNotification:) name:ABGovernmentSalaryDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(governmentNotification:) name:ABGovernmentPensionDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(governmentNotification:) name:ABGovernmentAveragePriceDidChangeNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark Notifications

- (void)governmentNotification:(NSNotification *)notification {
    NSLog(@"governmentNotification for %@, userInfo = %@", self.name, notification.userInfo);
}

- (void)salaryChangeNotification:(NSNotification *)notification {
    
    NSNumber *salary = [notification.userInfo objectForKey:ABGovernmentSalaryUserInfoKey];
    
    self.salary = [salary floatValue];
    
    NSLog(@"salaryChangeNotification for %@, new salary = %@", self.name, salary);
}



@end
