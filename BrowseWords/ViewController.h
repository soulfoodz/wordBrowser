//
//  ViewController.h
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableDictionary *wordsDict;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
