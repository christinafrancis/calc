//
//  myStack.h
//  calc
//
//  Created by Christina Francis on 10/12/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myStack : NSObject

@property NSMutableArray* stck ;

-(NSString *) pop;
-(NSString *) peep;
-(void) push:( NSString* )obj;
- (id) init;
@end
