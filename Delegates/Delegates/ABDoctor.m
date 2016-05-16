//
//  ABDoctor.m
//  Delegates
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABDoctor.h"

@implementation ABDoctor

#pragma mark - ABPatientDelegate

- (void)patientFeelsBad:(ABPatient *)patient {
    NSLog(@"%@ feels bad", patient.name);
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"%@ should rest", patient.name);
    }
}

- (void)patient:(ABPatient *)patient hasQuestion:(NSString *)question {
    NSLog(@"%@ has a question: %@", patient.name, question);
}

@end
