//
//  DetailViewController.m
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (atomic, strong) NSString *url;

@end

@implementation DetailViewController

+ (instancetype)loadFromNib
{
    return [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
}

- (void)openUrl:(NSString *)url {
    self.url = url;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

@end
