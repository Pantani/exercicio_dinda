//
//  DAO.h
//  Dinda
//
//  Created by Danilo Pantani on 09/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAO : NSObject

+(NSArray*)getTransactionDatabaseWithPath:(NSString*)path;
+(NSMutableArray*)getAccountDatabaseWithPath:(NSString*)path;

@end