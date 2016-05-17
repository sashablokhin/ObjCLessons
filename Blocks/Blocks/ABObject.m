//
//  ABObject.m
//  Blocks
//
//  Created by Alexander Blokhin on 17.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABObject.h"

@interface ABObject()

@property (copy, nonatomic) ObjectBlock privateBlock;

@end

@implementation ABObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak ABObject *weakSelf = self;
        
        self.privateBlock = ^{
            //NSLog(@"%@", self.name); // объект не будет уничтожен т.к блок захватывает сам себя сильной ссылкой
            NSLog(@"%@", weakSelf.name);
        };
        
    }
    return self;
}

- (void)dealloc {
    NSLog(@"ABObject is deallocated");
}

- (void)methodWitBlock:(ObjectBlock)block {
    block();
}

@end
