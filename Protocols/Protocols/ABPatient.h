//
//  ABPatient.h
//  Protocols
//
//  Created by Alexander Blokhin on 13.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#ifndef ABPatient_h
#define ABPatient_h

// протокол - список требований и рекомендаций который обязан реализовать каждый класс, подписавшийся на этот протокол

@protocol ABPatient <NSObject> // в данном случае NSObject - протокол а не класс

@property (strong, nonatomic) NSString *name;

- (BOOL)areYouOK;
- (void)takePill;
- (void)makeShot;

@optional
- (NSString *)howIsYourFamily;
- (NSString *)howIsYourJob;

@end

#endif /* ABPatient_h */
