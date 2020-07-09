//
//  DetailViewController.h
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet WKWebView *webView;

- (void)openUrl:(NSString *)url;

+ (instancetype)loadFromNib;

@end
