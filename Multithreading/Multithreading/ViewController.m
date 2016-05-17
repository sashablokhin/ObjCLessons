//
//  ViewController.m
//  Multithreading
//
//  Created by Alexander Blokhin on 17.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray array];

    /*
    //[self performSelectorInBackground:@selector(thread) withObject:nil];
    
    //NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(thread) object:nil];
    //[thread start];
    
    NSLog(@"%d", [NSThread isMainThread]);
    
    for (int i = 0; i < 10; i++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(thread) object:nil];
        thread.name = [NSString stringWithFormat:@"thread #%d", i];
        [thread start];
    }
    
    // обращение из двух потоков к одному массиву
    
    NSThread *threadX = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
    NSThread *thread0 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"0"];
    
    threadX.name = @"thread X";
    thread0.name = @"thread 0";
    
    [threadX start];
    [thread0 start];
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
     */
    
    [self gcd];
    
}

- (void)addStringToArray:(NSString *)string {
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        // @synchronized - блокирует доступ к другим потокам, при Serial можно не делать
        //@synchronized(self) {
            for (int i = 0; i < 200000; i++) {
                [self.array addObject:string];
            }
        //}
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        
    }
}

- (void)printArray {
    NSLog(@"%@", self.array);
}

- (void)thread {
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        for (int i = 0; i < 2000000; i++) {
            //NSLog(@"%d", i);
        }
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}

// ------------ Grand Central Dispatch -------------

- (void)gcd {
    
    // queue - очередь блоков, первые добавленные блоки будут выполнены первыми
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        for (int i = 0; i < 200000; i++) {
        }
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Обновление gui
        });
        
    });
    
    /*
    dispatch_async(queue, ^{
        [self addStringToArray:@"x"];
    });
    
    dispatch_async(queue, ^{
        [self addStringToArray:@"0"];
    });
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    */
    
    // serial - выполняется последовательно
    
    dispatch_queue_t serialQueue = dispatch_queue_create("sashablokhin.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serialQueue, ^{
        [self addStringToArray:@"x"];
    });
    
    dispatch_async(serialQueue, ^{
        [self addStringToArray:@"0"];
    });
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
}

@end










