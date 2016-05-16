//
//  main.m
//  Methods
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABChildClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        ABChildClass *childClass = [[ABChildClass alloc] init];
        [childClass sayHello];
        [childClass say:@"How are you?"];
        [childClass say:@"I was worried about you" and:@"where have you been?"];
        [childClass say:@"Hope you are ok!" and:@"Are you?" andAfterThat:@"Are you sure?"];
        
        NSLog(@"%@", [childClass saySomething]);
        
        [ABChildClass whoAreYou];
        
    }
    return 0;
}
