//
//  ABStudent.h
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABPatient.h"

@interface ABStudent : NSObject <ABPatient>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *universityName;

- (void)study;

@end
