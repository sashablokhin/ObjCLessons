//
//  ABDoctor.h
//  Delegates
//
//  Created by Alexander Blokhin on 16.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABPatient.h"

@interface ABDoctor : NSObject <ABPatientDelegate>

@end
