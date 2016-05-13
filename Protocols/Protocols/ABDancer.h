//
//  ABDancer.h
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABPatient.h"

@interface ABDancer : NSObject <ABPatient>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *favoriteDance;

- (void)dance;

@end
