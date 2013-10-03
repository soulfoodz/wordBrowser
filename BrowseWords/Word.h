//
//  Word.h
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (strong, nonatomic) NSString *word;
@property (strong, nonatomic) NSString *definition;
@property (strong, nonatomic) NSMutableArray *synonyms;


- (id)initWithWord:(NSString *)word andDefinition:(NSString *)def;

@end
