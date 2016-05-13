//
//  ABParentClass.m
//  Methods
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABParentClass.h"

@implementation ABParentClass

// - метод объекта, + - метод класса

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class is initialized");
    }
    return self;
}

+ (void)whoAreYou {
    NSLog(@"I am ABParentClass");
}

- (void)sayHello {
    NSLog(@"Parent says hello");
}

- (void)say:(NSString *)string {
    NSLog(@"%@", string);
}

- (void)say:(NSString *)string and:(NSString *)string2 {
    NSLog(@"%@, %@", string, string2);
}

- (void)say:(NSString *)string and:(NSString *)string2 andAfterThat:(NSString *)string3 {
    NSLog(@"%@, %@, %@", string, string2, string3);
}

// private method - нет в хедере
- (NSString *)sayDate {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString *)saySomething {
    NSString *string = [self sayDate];
    return string;
}

@end
