//
//  ABStudent.m
//  KVC-KVO
//
//  Created by Alexander Blokhin on 20.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ABStudent.h"

@implementation ABStudent

- (void)setName:(NSString *)name {
    _name = name;
    
    NSLog(@"student setName: %@", name);
}

- (void)setAge:(NSInteger)age {
    _age = age;
    
    NSLog(@"student setAge: %ld", age);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Student: %@ %ld", self.name, self.age];
}

// вызывается если такого ключа нет
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"setValueForUndefinedKey");
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"valueForUndefinedKey");
    return nil;
}
/*
- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError {
    
    if ([inKey isEqualToString:@"name"]) {
        NSString *newName = *ioValue;
        
        if (![newName isKindOfClass:[NSString class]]) {
            *outError = [[NSError alloc] initWithDomain:@"Not NSString" code:1 userInfo:nil];
            return false;
        }
        
        if ([newName containsString:@"1"]) {
            *outError = [[NSError alloc] initWithDomain:@"Has numbers" code:2 userInfo:nil];
            return false;
        }
    }
    
    return true;
}
*/

- (BOOL)validateName:(inout id  _Nullable __autoreleasing *)ioValue error:(out NSError * _Nullable __autoreleasing *)outError {
    NSLog(@"AAA");
    return true;
}

@end
