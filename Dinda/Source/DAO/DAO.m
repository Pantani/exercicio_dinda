//
//  DAO.m
//  Dinda
//
//  Created by Danilo Pantani on 09/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import "DAO.h"
#import "Constants.h"
#import "Account.h"
#import "Transaction.h"

@implementation DAO

+(NSArray*)getTransactionDatabaseWithPath:(NSString*)path
{
    
    NSMutableArray *database = [[NSMutableArray alloc] init];
    
    NSError* error = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    NSAssert(fileContents != nil, @"Arquivo não pode ser aberto");
    NSAssert(error == nil, error.description);
    
    NSArray* rows = [fileContents componentsSeparatedByString:kLineBreakSeparator];
    for (NSString *row in rows){
        
        NSArray* columns = [row componentsSeparatedByString:kValueSeparator];
        NSNumber *account_id = columns[0];
        NSNumber *transaction_value = columns[1];
        NSAssert(account_id != nil || transaction_value != nil, @"Problema ao ler arquivo");
        
        Transaction *transaction = [[Transaction alloc] initWithAccountID:account_id.intValue transaction:transaction_value.intValue];
        [database addObject:transaction];
    }
    
    NSAssert(database != nil, @"Banco de dados nulo");
    return database;
}

+(NSMutableArray*)getAccountDatabaseWithPath:(NSString*)path
{
    NSMutableArray *database = [[NSMutableArray alloc] init];
    
    NSError* error = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    NSAssert(fileContents != nil, @"Arquivo não pode ser aberto");
    NSAssert(error == nil, error.description);
    
    NSArray* rows = [fileContents componentsSeparatedByString:kLineBreakSeparator];
    for (NSString *row in rows){
        
        if (row==nil || row.length==0)
            continue;
        
        NSArray* columns = [row componentsSeparatedByString:kValueSeparator];
        NSNumber *account_id = columns[0];
        NSNumber *balance = columns[1];
        NSAssert(account_id != nil || balance != nil, @"Problema ao ler arquivo");
        
        Account *account = [[Account alloc] initWithAccountID:account_id.intValue balance:balance.intValue];
        [database addObject:account];
    }
    
    NSAssert(database != nil, @"Banco de dados nulo");
    return database;
}

@end
