//
//  MainClass.m
//  KVC-KVO
//
//  Created by Alexander Blokhin on 20.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "MainClass.h"
#import "ABStudent.h"
#import "ABGroup.h"

@interface MainClass ()

@property (strong, nonatomic) ABGroup *group;
@property (strong, nonatomic) ABStudent *student;

@end

@implementation MainClass

- (void)launch {
    ABStudent *student = [[ABStudent alloc] init];
    student.name = @"Alex";
    student.age = 20;
    
    NSLog(@"%@", student);
    
    // KVC - Key Value Coding
    
    [student setValue:@"Roger" forKey:@"name"];
    [student setValue:@25 forKey:@"age"];
    
    [student setValue:@"Bad Roger" forKey:@"name1"]; // такого ключа нет
    
    NSLog(@"name = %@", [student valueForKey:@"name"]);
    
    NSLog(@"%@", student);
    
    // KVO - Key Value Observing
    
    self.student = student;
    
    [self.student addObserver:self
                   forKeyPath:@"name"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    [student setValue:@"Vova" forKey:@"name"];
    
    // -----------------------------
    
    ABStudent *student2 = [[ABStudent alloc] init];
    student2.name = @"Petya";
    student2.age = 24;
    
    ABStudent *student3 = [[ABStudent alloc] init];
    student3.name = @"Jack";
    student3.age = 23;
    
    ABStudent *student4 = [[ABStudent alloc] init];
    student4.name = @"Kolya";
    student4.age = 21;
    
    self.group  = [[ABGroup alloc] init];
    self.group.students = @[student, student2, student3, student4];
    
    [self.group addObserver:self
                   forKeyPath:@"students"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    NSLog(@"%@", self.group.students);
    
    NSMutableArray *array = [self.group mutableArrayValueForKey:@"students"];
    
    [array removeLastObject];
    
    NSLog(@"%@", self.group.students);
    
    // -----------------------------

    NSLog(@"name = %@", [self valueForKeyPath:@"student.name"]);
    
    // ----------validation---------
    
    //NSString *name = @"Alex";
    NSString *name = @"Alex111";
    //NSNumber *name = @111;
    NSError *error = nil;
    
    if (![self.student validateValue:&name forKey:@"name" error:&error]) {
        NSLog(@"%@", error);
    }
    
    // ------------------------------
    
    NSLog(@"students count %@", [self valueForKeyPath:@"group.students.@count"]);
    
    NSNumber *minAge = [self.group.students valueForKeyPath:@"@min.age"];
    NSLog(@"min age %@", minAge);
    
    NSNumber *maxAge = [self.group.students valueForKeyPath:@"@max.age"];
    NSLog(@"max age %@", maxAge);
    
    NSNumber *sumAge = [self.group.students valueForKeyPath:@"@sum.age"];
    NSLog(@"sum age %@", sumAge);
    
    NSNumber *avgAge = [self.group.students valueForKeyPath:@"@avg.age"];
    NSLog(@"avg age %@", avgAge);
    
    NSArray *allNames = [self.group.students valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"allNames = %@", allNames);
    
}

- (void)dealloc {
    [self.student removeObserver:self forKeyPath:@"name"];
    [self.group removeObserver:self forKeyPath:@"students"];
}

/* void * - указатель на любой объект
 observer ловит сигналы только когда вызывается сеттер. То есть если установить _name = @"New Name" он не будет вызван. 
 В таком случае можно использовать 
 [self willChangeValueForKey:@"name"];
 _name = @"New Name";
 [self didChangeValueForKey:@"name"];
*/

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    //id value = [change objectForKey:NSKeyValueChangeNewKey];
}

@end
