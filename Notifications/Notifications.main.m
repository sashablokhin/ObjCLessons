//
//  main.m
//  Notifications
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABGovernment.h"
#import "ABCitizen.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ABGovernment *government = [[ABGovernment alloc] init];
        
        ABCitizen *citizen1 = [[ABCitizen alloc] init];
        citizen1.name = @"Sasha";
        
        ABCitizen *citizen2 = [[ABCitizen alloc] init];
        citizen2.name = @"Vova";
        
        ABCitizen *citizen3 = [[ABCitizen alloc] init];
        citizen3.name = @"Petya";
        
        government.taxLevel = 5.5f;
        government.salary = 1100;
        government.averagePrice = 15;
        government.pension = 550;
        
    }
    return 0;
}
