//
//  ABPatient.m
//  Delegates
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABPatient.h"

@implementation ABPatient

- (BOOL)howAreYou {
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self];
    }
    
    return iFeelGood;
}

- (void)takePill {
    NSLog(@"%@ takes pill", self.name);
}

- (void)makeShot {
    NSLog(@"%@ make shot", self.name);
}

@end
