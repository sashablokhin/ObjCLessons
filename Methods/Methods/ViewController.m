//
//  ViewController.m
//  Methods
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"
#import "ABChildClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ABChildClass *childClass = [[ABChildClass alloc] init];
    [childClass sayHello];
    [childClass say:@"How are you?"];
    [childClass say:@"I was worried about you" and:@"where have you been?"];
    [childClass say:@"Hope you are ok!" and:@"Are you?" andAfterThat:@"Are you sure?"];
    
    NSLog(@"%@", [childClass saySomething]);
    
    [ABChildClass whoAreYou];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
