//
//  ABObject.m
//  Properties
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABObject.h"

@implementation ABObject

- (id)copyWithZone:(nullable NSZone *)zone {
    ABObject *newObject = [[ABObject alloc] init];
    newObject.name = self.name;
    
    return newObject;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Object is created");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Object is deallocated");
}

@end
