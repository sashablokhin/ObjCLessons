//
//  ABDancer.m
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABDancer.h"

@implementation ABDancer

- (void)dance {
    
}

#pragma mark - ABPatient

- (BOOL)areYouOK {
    BOOL isOk = arc4random() % 2;
    NSLog(@"Is dancer %@ ok? %@", self.name, isOk ? @"Yes" : @"No");
    return isOk;
}

- (void)takePill {
    NSLog(@"Dancer %@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"Dancer %@ makes a shot", self.name);
}

@end
