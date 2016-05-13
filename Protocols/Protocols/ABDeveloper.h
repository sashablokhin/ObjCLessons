//
//  ABDeveloper.h
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ABPatient.h"

@interface ABDeveloper : NSObject <ABPatient>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat experience;

- (void)work;

@end
