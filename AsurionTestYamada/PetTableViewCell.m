//
//  PetTableViewCell.m
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import "PetTableViewCell.h"


@interface PetTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UILabel *petNameLabel;

@end

@implementation PetTableViewCell

- (void)setPet:(Pet *)pet {
    _pet = pet;
    
    self.petNameLabel.text = pet.title;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pet.imageUrl]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:data];
            self.petImageView.image = image;
        });
    });
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
