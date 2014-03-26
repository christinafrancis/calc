//
//  myStack.m
//  calc
//
//  Created by Christina Francis on 10/12/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "myStack.h"

@implementation myStack

-(NSString *) pop{
    NSString* ret =[[NSString alloc]  initWithString:[self.stck lastObject]];
    [self.stck removeLastObject];
    NSLog(@"Called pop %@",self.stck);
    return ret;
}
-(NSString *) peep{
    
     NSLog(@"Called peep %@",self.stck);
    return  [self.stck lastObject];
   
}
-(void) push:( NSString* )obj{
   
    [self.stck addObject:obj];
    NSLog(@"Called push %@",self.stck);
}

-(id) init{
    self = [super init];
    self.stck = [[NSMutableArray alloc] init];
    [self.stck addObject:@"$"];
        NSLog(@"Called init %@",self.stck);
    return self;
}

@end
