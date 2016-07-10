//
//  main.m
//  Dinda
//
//  Created by Danilo Pantani on 08/07/16.
//  Copyright © 2016 Danilo Pantani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argv[1]!=nil) {
            NSString *accounts_path = [NSString stringWithUTF8String:argv[1]];
            NSString *transaction_path = [NSString stringWithUTF8String:argv[2]];
            [Controller startLogicWithAccount:accounts_path
                              andTransactions:transaction_path];
        }else{
            [Controller startLogic];
        }
    }
    return 0;
}

