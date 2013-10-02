//
//  DetailViewController.m
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import "DetailViewController.h"
#import "Word.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.definitionTextView.text = self.word.definition;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.word.synonyms.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *synonymsArray;
    Word *synonym;
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"synonymCell"];
    
    NSLog(@"%@", self.word.synonyms);
    
    synonymsArray = self.word.synonyms;
    synonym = synonymsArray[indexPath.row];
    cell.textLabel.text = synonym.word;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *newDVC;
    NSArray *synonymsArray;
    
    newDVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    
    synonymsArray = self.word.synonyms;
    newDVC.word = synonymsArray[indexPath.row];
    
    [self.navigationController pushViewController:newDVC animated:YES];
}



@end
