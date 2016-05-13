//
//  ABChildClass.m
//  Methods
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABChildClass.h"

@implementation ABChildClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class is initialized");
    }
    return self;
}

// override
- (NSString *)saySomething {
    
    //[self sayDate] - не видит так как мы вставляем хедер от ABParentClass а в нем нет такого метода
    // тоесть приватные методы при наследовании не доступны в потомке
    
    NSLog(@"%@", [super saySomething]); // вызов метода базового класса
    
    return @"Something";
}

@end
