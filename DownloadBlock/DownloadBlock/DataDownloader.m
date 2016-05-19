//
//  DataDownloader.m
//  DownloadBlock
//
//  Created by Alexander Blokhin on 19.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "DataDownloader.h"

@interface DataDownloader () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, copy) CompletionBlock completion;

@end

@implementation DataDownloader

NSURLConnection *_connection;
NSMutableData *_downloadedData;


+ (instancetype)downloadDataFromURL:(NSURL *)url completionBlock:(CompletionBlock)completion {
    return [[self alloc] initWithURL:url completionBlock:completion];
}

- (id)initWithURL:(NSURL *)url completionBlock:(CompletionBlock)completion {

    self = [super init];
    _downloadedData = [NSMutableData new];
    
    self.completion = completion;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    return self;
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    self.completion(nil, error);
    self.completion = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.completion(_downloadedData, nil);
    self.completion = nil;
}

@end
