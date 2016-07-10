//
//  Controller.m
//  Dinda
//
//  Created by Danilo Pantani on 08/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import "Controller.h"
#import "Transaction.h"
#import "Constants.h"
#import "Account.h"
#import "DAO.h"

@interface Controller ()

@property (nonatomic, strong) NSString *accounts_path;
@property (nonatomic, strong) NSString *transactions_path;

@property (nonatomic, strong) NSMutableArray *accounts;
@property (nonatomic, strong) NSArray *transactions;

@end

@implementation Controller
@synthesize accounts_path = _accounts_path;
@synthesize transactions_path = _transactions_path;
@synthesize accounts = _accounts;
@synthesize transactions = _transactions;

#pragma mark - LifeCycle
static id _sharedInstance = nil;

+(Controller*)shared{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(id) init;
{
    self = [super init];
    if (self != nil) {
        
    }
    return self;
}

#pragma mark - Public Methods

+(void)startLogic
{
    [[self shared] startLogicWithAccount:nil andTransactions:nil];
}

+(void)startLogicWithAccount:(NSString*)accounts_path andTransactions:(NSString*)transactions_path
{
    [[self shared] startLogicWithAccount:accounts_path andTransactions:transactions_path];
}

#pragma mark - Private Methods

-(void)startLogicWithAccount:(NSString*)accounts_path andTransactions:(NSString*)transactions_path
{
    _accounts_path = accounts_path;
    _transactions_path = transactions_path;
    
    [self getPaths];
    [self getDatabase];
    
    for (Transaction *temp in _transactions) {
        [self changeAccount:temp.account_id withBalance:temp.transaction];
    }
    [self printDatabase];
}

-(void)getPaths
{
    if (_accounts_path==nil || _accounts_path.length==0) {
        
        char input_account[200];
        printf("Inserir o nome do arquivo de contas: ");
        scanf("%s", input_account);
        _accounts_path = [NSString stringWithUTF8String:input_account];
        
    }
    
    NSAssert(_accounts_path != nil || _accounts_path.length>0, @"Nome do arquivo de contas esta nulo");
    
    if (_transactions_path==nil || _transactions_path.length==0) {
        
        char input_transaction[200];
        printf("Inserir o nome do arquivo de transações: ");
        scanf("%s", input_transaction);
        _transactions_path = [NSString stringWithUTF8String:input_transaction];
        
    }
    
    NSAssert(_transactions_path != nil || _transactions_path.length>0, @"Nome do arquivo de transações esta nulo");
}

-(void)getDatabase
{
    //#warning alterar testes
    //    _accounts = [DAO getAccountDatabaseWithPath:kAccountsPath];
    //    _transactions = [DAO getTransactionDatabaseWithPath:kTransactionsPath];
    _accounts = [DAO getAccountDatabaseWithPath:_accounts_path];
    _transactions = [DAO getTransactionDatabaseWithPath:_transactions_path];
}

-(void)printDatabase
{
    for (Account *temp in _accounts) {
        fprintf(stdout, "%d,%d\n", temp.account_id,temp.balance);
    }
}

-(void)changeAccount:(int)account_id withBalance:(int)value
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"account_id == %d",account_id];
    NSArray *filtered = [_accounts filteredArrayUsingPredicate:predicate];
    
    NSAssert(filtered.count>0, @"Conta não encontrada");
    
    if (filtered.count>0){
        Account *temp = [filtered firstObject];
        temp.balance += value;
        
        if (temp.balance<0 && value<0) {
            //NSLog(@"Saldo negativo, uma multa de R$5,00 foi aplicada!\n");
            temp.balance -= kPenaltyValue;
        }
    }else{
        NSLog(@"A conta da transação efetuada não foi encontrada!\n");
    }
}

@end