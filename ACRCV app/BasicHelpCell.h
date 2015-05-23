//
//  BasicHelpCell.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicHelpCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *BHTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *BHBackgroundImage;
@property (weak, nonatomic) IBOutlet UITextView *BHTextView;

@end
