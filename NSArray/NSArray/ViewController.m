//
//  ViewController.m
//  NSArray
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"
#import "ABObject.h"
#import "ABChild.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"String 1", @"String 2", @"String 3", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"String 1", @"String 2", @"String 3", nil];
    //NSArray *array3 = @[@"String 1", @"String 2", @"String 3"];
    
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@", [array objectAtIndex:i]);
    }
    
    for (NSString *string in array2) {
        NSLog(@"%@", string);
        NSLog(@"%lu", [array indexOfObject:string]);
    }
    
    ABObject *obj1 = [[ABObject alloc] init];
    obj1.name = @"Name 1";
    
    ABObject *obj2 = [[ABObject alloc] init];
    obj2.name = @"Name 2";
    
    ABChild *obj3 = [[ABChild alloc] init];
    [obj3 setName:@"Name3"];
    [obj3 setLastName:@"LastName"];
    
    // Полиморфизм - объединяем объекты в группу по их предку ABObject и обращаемся в цикле к методу name
    NSArray *objArray = [NSArray arrayWithObjects:obj1, obj2, obj3, nil];
    
    // нам даже не нужно уточнять что в массиве есть объект ABChild
    for (ABObject *obj in objArray) {
        NSLog(@"%@", obj.name);
        [obj action];
        
        if ([obj isKindOfClass:[ABChild class]]) {
            ABChild *child = (ABChild *) obj;
            NSLog(@"%@", child.lastName);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
