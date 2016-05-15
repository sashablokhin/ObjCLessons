//
//  main.m
//  NSDictionary
//
//  Created by Alexander Blokhin on 15.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"Petrov", @"lastName",
                                    @"Vasiliy", @"name",
                                    [NSNumber numberWithInt:25], @"age",
                                    nil];
        
        NSLog(@"%@", dictionary);
        
        NSLog(@"name = %@, lastName = %@, age = %ld",
              [dictionary objectForKey:@"name"],
              [dictionary objectForKey:@"lastName"],
              [[dictionary objectForKey:@"age"] integerValue]);
        
        NSDictionary *dictionary2 = @{@"lasName" : @"Petrov", @"name" : @"Vasiliy", @"age" : @25};
        NSLog(@"%@", dictionary2);
        
    
        NSInteger age = 25;
        
        NSDictionary *dictionary3 = @{@"lasName" : @"Petrov", @"name" : @"Vasiliy", @"age" : @(age)};
        NSLog(@"%@", dictionary3);
        
        
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key = %@, obj = %@", key, obj);
        }];
        
    }
    return 0;
}
