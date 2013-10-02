//
//  DetailViewController.h
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Word;

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextView *definitionTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Word *word;

@end
