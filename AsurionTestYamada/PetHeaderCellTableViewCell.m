//
//  PetHeaderCellTableViewCell.m
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/09.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import "PetHeaderCellTableViewCell.h"

@implementation PetHeaderCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.officeHoursLabel.text = @"Loading...";
}

- (void)setChatAndCallButton:(BOOL)chatAvailable withCall:(BOOL)callAvailable
{
    if (chatAvailable && callAvailable) {
        
    } else if (chatAvailable) {
        [self.callView removeFromSuperview];
    } else if (callAvailable) {
        [self.chatView removeFromSuperview];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)showAlert {
    NSString *message = nil;
    
    NSDate *date = [NSDate date];
    NSInteger hour = 0;
    NSInteger minute = 0;
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    [currentCalendar getHour:&hour minute:&minute second:NULL nanosecond:NULL fromDate:date];
    
    if (hour > 9 && hour < 18) { // TODO: stop hard coded check and parse from response json
        message = @"Thank you for getting in touch with us. We’ll get back to you as soon as possible";
    } else {
        message = @"Work hours has ended. Please contact us again on the next work day";
        
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                      }]];
    
    [[UIApplication sharedApplication].windows.firstObject.rootViewController presentViewController:alertController animated:YES completion:nil];

}

- (IBAction)callButtonPushed:(id)sender {
    [self showAlert];
}

- (IBAction)chatButtonPushed:(id)sender {
    [self showAlert];
}

@end
