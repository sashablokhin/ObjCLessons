//
//  ABParentClass.h
//  Methods
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABParentClass : NSObject

+ (void)whoAreYou;

- (void)sayHello;
- (void)say:(NSString *)string;
- (void)say:(NSString *)string and:(NSString *)string2;
- (void)say:(NSString *)string and:(NSString *)string2 andAfterThat:(NSString *)string3;
- (NSString *)saySomething;

@end
