//
//  Word.m
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import "Word.h"

@implementation Word


- (id)initWithWord:(NSString *)word andDefinition:(NSString *)def;
{
    self = [super init];
    if (self)
    {
        self.word = word;
        self.definition = def;
    }
    return self;
}

@end
