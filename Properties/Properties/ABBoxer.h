//
//  ABBoxer.h
//  Properties
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ABBoxer : NSObject

@property (strong, nonatomic) NSString *name; // strong - для указателей
@property (assign, nonatomic) NSInteger age; // assign - для примитивных типов вроде int, float, bool
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;

- (NSInteger) howOldAreYou;

@end
