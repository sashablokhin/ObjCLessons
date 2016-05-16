//
//  main.m
//  Delegates
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABDoctor.h"
#import "ABPatient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ABPatient *patient1 = [[ABPatient alloc] init];
        patient1.name = @"Vova";
        patient1.temperature = 36.6f;
        
        ABPatient *patient2 = [[ABPatient alloc] init];
        patient2.name = @"Petya";
        patient2.temperature = 40.2f;
        
        ABPatient *patient3 = [[ABPatient alloc] init];
        patient3.name = @"Dima";
        patient3.temperature = 37.1f;
        
        ABPatient *patient4 = [[ABPatient alloc] init];
        patient4.name = @"Sasha";
        patient4.temperature = 38.f;
        
        ABDoctor *doctor = [[ABDoctor alloc] init];

        patient1.delegate = doctor;
        patient2.delegate = doctor;
        patient3.delegate = doctor;
        patient4.delegate = doctor;
        
        NSLog(@"%@ are you ok? %@", patient1.name, [patient1 howAreYou] ? @"Yes" : @"No");
        NSLog(@"%@ are you ok? %@", patient2.name, [patient2 howAreYou] ? @"Yes" : @"No");
        NSLog(@"%@ are you ok? %@", patient3.name, [patient3 howAreYou] ? @"Yes" : @"No");
        NSLog(@"%@ are you ok? %@", patient4.name, [patient4 howAreYou] ? @"Yes" : @"No");
        
    }
    return 0;
}
