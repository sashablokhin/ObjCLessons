//
//  ViewController.m
//  Properties
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"
#import "ABBoxer.h"
#import "ABObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self initBoxer];
    
    //[self initStrongObject];
    self.strongObject = nil; // освобождаем сильную ссылку и объект удаляется
    
    [self initCopyObject];
    
    NSLog(@"initObject is over");
}

- (void)initBoxer {
    ABBoxer *boxer = [[ABBoxer alloc] init];
    
    /*
     boxer.name = @"Vasiliy";
     boxer.age = 25;
     boxer.height = 1.8f;
     boxer.weight = 80.f;
     
     NSLog(@"name = %@", boxer.name);
     NSLog(@"age = %ld", boxer.age);
     NSLog(@"height = %f", boxer.height);
     NSLog(@"weight = %f", boxer.weight);
     */
    
    // сеттеры
    [boxer setName:@"Vasiliy"];
    [boxer setAge:25];
    [boxer setHeight:1.8f];
    [boxer setWeight:80.f];
    
    // геттеры
    NSLog(@"name = %@", [boxer name]);
    NSLog(@"age = %ld", [boxer age]);
    NSLog(@"height = %f", [boxer height]);
    NSLog(@"weight = %f", [boxer weight]);
    
    NSLog(@"age = %ld", [boxer howOldAreYou]);
    
    NSLog(@"name = %@", boxer.name);
    NSLog(@"name = %@", [boxer name]);
}

- (void)initStrongObject {
    ABObject *obj = [[ABObject alloc] init]; // 1 сильная ссылка удалится при выходе из метода
    self.strongObject = obj; // вторая сильная ссылка держит объект держит и не удалится
}

- (void)initCopyObject {
    ABObject *obj = [[ABObject alloc] init];
    self.cpyObject = obj; // создается новый объект с указанием на него сильной ссылки, объект с которого мы делали копию будет уничтожен т.к. на него больше не указывает сильная ссылка
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



