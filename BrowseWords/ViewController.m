//
//  ViewController.m
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "Word.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wordsDict = [NSMutableDictionary new];

    Word *football      = [[Word alloc] initWithWord:@"football"    andDefinition:@"Ball you play football with"];
    Word *baseball      = [[Word alloc] initWithWord:@"baseball"    andDefinition:@"Ball you play baseball with"];
    Word *soccerball    = [[Word alloc] initWithWord:@"soccerball"  andDefinition:@"Ball you play soccer with"];
    Word *tennisball    = [[Word alloc] initWithWord:@"tennisball"  andDefinition:@"Ball you play tennis with"];
    Word *golfball      = [[Word alloc] initWithWord:@"golfball"    andDefinition:@"Ball you play golf with"];
    Word *basketball    = [[Word alloc] initWithWord:@"basketball"  andDefinition:@"Ball you play football with"];
//    Word *pizza         = [[Word alloc] initWithWord:@"pizza"       andDefinition:@"Crust, sauce, cheese, basil. Yum"];
//    Word *cookies       = [[Word alloc] initWithWord:@"cookies"     andDefinition:@"Flour, butter, egg, sugar, bake"];
//    Word *pan           = [[Word alloc] initWithWord:@"pan"         andDefinition:@"Cooking eggs"];
//    Word *table         = [[Word alloc] initWithWord:@"table"       andDefinition:@"Four legs, one flat surface"];
//    Word *flyball       = [[Word alloc] initWithWord:@"flyball"     andDefinition:@"Ball hit in the air"];
//    Word *groundball    = [[Word alloc] initWithWord:@"groundball"  andDefinition:@"Ball hit on ground"];
//    Word *alinea        = [[Word alloc] initWithWord:@"alinea"      andDefinition:@"New paragraph symbol"];
//    Word *computer      = [[Word alloc] initWithWord:@"computer"    andDefinition:@"Brain with a keyboard and screen"];
//    Word *iphone        = [[Word alloc] initWithWord:@"iphone"      andDefinition:@"Whoah"];
//    Word *coke          = [[Word alloc] initWithWord:@"coke"        andDefinition:@"Not the real thing"];
//    Word *apple         = [[Word alloc] initWithWord:@"apple"       andDefinition:@"No worms please"];
//    Word *food          = [[Word alloc] initWithWord:@"food"        andDefinition:@"Get in my belly"];
//    Word *book          = [[Word alloc] initWithWord:@"book"        andDefinition:@"Get learned"];
//    Word *rubberSpatula = [[Word alloc] initWithWord:@"rubberSpatula" andDefinition:@"Not a self-protection device"];
    
    
    football.synonyms   = @[baseball, golfball];
    baseball.synonyms   = @[tennisball, basketball];
    tennisball.synonyms = @[football, basketball];
    golfball.synonyms   = @[soccerball, baseball];

    [self.wordsDict setObject:football   forKey:football.word];
    [self.wordsDict setObject:baseball   forKey:baseball.word];
    [self.wordsDict setObject:tennisball forKey:tennisball.word];
    [self.wordsDict setObject:golfball   forKey:golfball.word];

    
    
    


}


@end
