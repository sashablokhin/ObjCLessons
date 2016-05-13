//
//  ABDeveloper.m
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABDeveloper.h"

@implementation ABDeveloper

- (void)work {
    
}

#pragma mark - ABPatient

- (BOOL)areYouOK {
    BOOL isOk = arc4random() % 2;
    NSLog(@"Is developer %@ ok? %@", self.name, isOk ? @"Yes" : @"No");
    return isOk;
}

- (void)takePill {
    NSLog(@"Developer %@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"Developer %@ makes a shot", self.name);
}

- (NSString *)howIsYourJob {
    return @"My job is awesome";
}

@end
