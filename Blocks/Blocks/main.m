//
//  main.m
//  Blocks
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MainClass *main = [[MainClass alloc] init];
        [main load];
        [main arc];
        
    }
    return 0;
}

