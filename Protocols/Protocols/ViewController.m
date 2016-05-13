//
//  ViewController.m
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"
#import "ABStudent.h"
#import "ABDancer.h"
#import "ABDeveloper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ABDancer *dancer1 = [[ABDancer alloc] init];
    ABDancer *dancer2 = [[ABDancer alloc] init];
    
    ABStudent *student1 = [[ABStudent alloc] init];
    ABStudent *student2 = [[ABStudent alloc] init];
    ABStudent *student3 = [[ABStudent alloc] init];
    
    ABDeveloper *developer1 = [[ABDeveloper alloc] init];
    
    dancer1.name = @"dancer 1";
    dancer2.name = @"dancer 2";
    
    student1.name = @"student 1";
    student2.name = @"student 2";
    student3.name = @"student 3";
    
    developer1.name = @"developer1";
    
    NSObject *fake = [[NSObject alloc] init];
    
    NSArray *patients = [NSArray arrayWithObjects:fake, dancer1, dancer2, student1, student2, student3, developer1, nil];
    
    // цикл по общему предку NSObject. Полиморфизм по свойствам
    
    for (id <ABPatient> patient in patients) {
        
        // conformsToProtocol - проверка объект на принадлежность к протоколу
        
        if (![patient conformsToProtocol:@protocol(ABPatient)]) {
            continue; // переход к следующей итерации
        }
        
        NSLog(@"Patient: %@", patient.name);
        
        // respondsToSelector - метод протокола NSObject, имеет ли объект такой метод?
        
        if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
            NSLog(@"How is your family? %@", [patient howIsYourFamily]);
        }
        
        if ([patient respondsToSelector:@selector(howIsYourJob)]) {
            NSLog(@"How is your job? %@", [patient howIsYourJob]);
        }
        
        if (![patient areYouOK]) {
            [patient takePill];
            
            if (![patient areYouOK]) {
                [patient makeShot];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

















