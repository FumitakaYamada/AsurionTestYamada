//
//  MasterViewController.h
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSURLSessionDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

