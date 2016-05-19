//
//  DataDownloader.h
//  DownloadBlock
//
//  Created by Alexander Blokhin on 19.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(NSData *data, NSError *error);

@interface DataDownloader : NSObject

+ (instancetype)downloadDataFromURL:(NSURL *)url completionBlock:(CompletionBlock)completion;

@end
