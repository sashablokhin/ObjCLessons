//
//  ABObject.h
//  Blocks
//
//  Created by Alexander Blokhin on 17.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ObjectBlock)(void);

@interface ABObject : NSObject

@property (strong, nonatomic) NSString *name;

- (void)methodWitBlock:(ObjectBlock)block;

@end
