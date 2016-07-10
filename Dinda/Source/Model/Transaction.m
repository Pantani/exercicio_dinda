//
//  Transaction.m
//  Dinda
//
//  Created by Danilo Pantani on 08/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction
@synthesize account_id = _account_id;
@synthesize value = _value;

- (id)initWithAccountID:(int)account_id
                  value:(int)value;
{
    NSAssert(account_id > 0, @"id inválido");
    _account_id = account_id;
    _value = value;
    
    return self;
}

- (NSString *)description
{
    NSAssert(_account_id > 0, @"id inválido");
    return [NSString stringWithFormat:@"Transacao: id='%d' valor='%d'",
            _account_id,
            _value];
}

@end