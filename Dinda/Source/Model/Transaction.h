//
//  Transaction.h
//  Dinda
//
//  Created by Danilo Pantani on 09/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property (nonatomic, assign) int account_id;
@property (nonatomic, assign) int transaction;

- (id)initWithAccountID:(int)account_id
            transaction:(int)transaction;

@end