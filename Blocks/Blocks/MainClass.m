//
//  MainClass.m
//  Blocks
//
//  Created by Alexander Blokhin on 17.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "MainClass.h"
#import "ABObject.h"

// блок - это объект который содержит кусок кода (по сути это указатель на функцию)

typedef void (^OurBlock)(void);

@interface MainClass()

@property (copy, nonatomic) OurBlock block; // блоки должны быть всегда copy
@property (strong, nonatomic) NSString *name;

@end

@implementation MainClass

- (void)load {
    
    void (^testBlock)(void); // объявление блока
    
    testBlock = ^{
        NSLog(@"testBlock"); // содержимое блока
    };
    
    testBlock(); // вызов блока
    testBlock();
    
    // блок с параметрами
    
    void (^testBlockWithParams)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
        NSLog(@"testBlockWithParams %@, %ld", string, intValue);
    };
    
    testBlockWithParams(@"string", 111);
    
    // блок с возвращаемым значением
    
    NSString * (^testBlockWithReturnAndParams)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
        return [NSString stringWithFormat:@"testBlockWithReturnAndParams %@, %ld", string, intValue];
    };
    
    NSLog(@"%@", testBlockWithReturnAndParams(@"string", 222));
    
    // отличие от методов в том что в блоке можно использовать переменные из текущего контекста
    
    NSString *str = @"How is it possible?";
    __block NSInteger count = 0; // __block говорит о том что переменная будет изменяться в блоке
    
    void (^anotherBlock)(void) = ^{
        NSLog(@"%@", str); // str - держится сильной ссылкой
        NSLog(@"%ld", ++count);
    };
    
    anotherBlock();
    anotherBlock();
    anotherBlock();
    
    // метод, который принимает блок
    
    [self testMethodWithBlock:^{
        NSLog(@"block");
    }];
    
    OurBlock ourBlock = ^{
        NSLog(@"ourBlock");
    };
    
    [self testMethodWithOurBlock:ourBlock];
    
}

// void (^)(void) - тип данных, block - название переменной

- (void)testMethodWithBlock:(void (^)(void))block {
    NSLog(@"testMethodWithBlock");
    block();
}

- (void)testMethodWithOurBlock:(OurBlock)block {
    NSLog(@"testMethodWithOurBlock");
    block();
}

// время жизни объекта

- (void)arc {
    /*
    ABObject *obj = [[ABObject alloc] init];
    obj.name = @"Object";
    
    __weak ABObject *weakObj = obj;
    
    self.block = ^{
        // блок держит попавшие в него объекты сильной ссылкой
        NSLog(@"%@", weakObj.name);
    };
    
    self.block();
    */
    // ----------------------
    
    self.name = @"MainClass";
    
    ABObject *obj = [[ABObject alloc] init];
    obj.name = @"ABObject";
    
    [obj methodWitBlock:^{
        NSLog(@"%@", self.name); // в данном случае self берется из контекста, тоесть он указывает на MainClass
    }];
    
}

@end









