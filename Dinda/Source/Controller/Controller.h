//
//  Controller.h
//  Dinda
//
//  Created by Danilo Pantani on 09/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Controller : NSObject

+(void)startLogic;
+(void)startLogicWithAccount:(NSString*)accounts_path andTransactions:(NSString*)transactions_path;

@end