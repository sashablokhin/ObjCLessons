//
//  ABPatient.h
//  Delegates
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ABPatientDelegate;

@interface ABPatient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) float temperature;
@property (weak, nonatomic) id <ABPatientDelegate> delegate; // delegate всегда weak

- (BOOL)howAreYou;
- (void)takePill;
- (void)makeShot;

@end

@protocol ABPatientDelegate <NSObject>
@optional
- (void)patientFeelsBad:(ABPatient *)patient;
- (void)patient:(ABPatient *)patient hasQuestion:(NSString *)question;
@end