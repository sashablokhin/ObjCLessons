//
//  main.m
//  DownloadBlock
//
//  Created by Alexander Blokhin on 19.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataDownloader.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:@"http://www.kittens.com/kitten.png"];
        
        DataDownloader *downloader = [DataDownloader downloadDataFromURL:url completionBlock:^(NSData *data, NSError *error) {
            
            if (!error) {
                NSLog(@"Picture downloaded! %@", data);
            }
            
        }];
        
    }
    return 0;
}
