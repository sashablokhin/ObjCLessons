//
//  ABStudent.m
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABStudent.h"

@implementation ABStudent

- (void)study {
    
}

#pragma mark - ABPatient 

- (BOOL)areYouOK {
    BOOL isOk = arc4random() % 2;
    NSLog(@"Is student %@ ok? %@", self.name, isOk ? @"Yes" : @"No");
    return isOk;
}

- (void)takePill {
    NSLog(@"Student %@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"Student %@ makes a shot", self.name);
}

- (NSString *)howIsYourFamily {
    return @"My family is doing well";
}

@end
