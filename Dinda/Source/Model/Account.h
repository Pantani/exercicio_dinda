//
//  Account.h
//  Dinda
//
//  Created by Danilo Pantani on 08/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (nonatomic, assign) int account_id;
@property (nonatomic, assign) int balance;

- (id)initWithAccountID:(int)account_id
                balance:(int)balance;

@end