//
//  ABBoxer.m
//  Properties
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABBoxer.h"

// инкапсуляция скрытие для других
@interface ABBoxer() // категории
@property (assign, nonatomic) NSInteger nameCount; // расширение нашего класса, скрытое свойство
@end

@implementation ABBoxer

@synthesize name = _name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameCount = 0;
    }
    return self;
}

// override

- (void)setName:(NSString *)inputName {
    NSLog(@"setter setName is called");
    
    //self.name = name; вызовется setName и будет бесконечный цикл
    _name = inputName; // обращение напрямую в обход сеттера _name ivar - внутренняя переменная
}

- (NSString *)name {
    self.nameCount++;
    
    NSLog(@"name getter is called %ld times", self.nameCount);
    
    return _name;
}

- (NSInteger)age {
    NSLog(@"getter age is called");
    return _age;
}

- (NSInteger) howOldAreYou {
    return self.age; // обращение через геттер
}

@end
