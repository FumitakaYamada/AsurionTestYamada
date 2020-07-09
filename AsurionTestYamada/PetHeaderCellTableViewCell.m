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
        self.callButtonWidth.constant = self.frame.size.width / 2;
        self.chatButtonWidth.constant = self.frame.size.width / 2;
    } else if (chatAvailable) {
        self.callButtonWidth.constant = 0;
        self.chatButtonWidth.constant = self.frame.size.width;
    } else {
        self.callButtonWidth.constant = self.frame.size.width;
        self.chatButtonWidth.constant = 0;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (IBAction)callButtonPushed:(id)sender {
    
}

- (IBAction)chatButtonPushed:(id)sender {
    
}

@end
