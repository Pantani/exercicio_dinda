//
//  Account.m
//  Dinda
//
//  Created by Danilo Pantani on 08/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import "Account.h"

@implementation Account
@synthesize account_id = _account_id;
@synthesize balance = _balance;

- (id)initWithAccountID:(int)account_id
                balance:(int)balance
{
    NSAssert(account_id > 0, @"id inválido");
    _account_id = account_id;
    _balance = balance;
    
    return self;
}

- (NSString *)description
{
    NSAssert(_account_id > 0, @"id inválido");
    return [NSString stringWithFormat:@"Conta: id='%d' saldo='%d'",
            _account_id,
            _balance];
}

@end