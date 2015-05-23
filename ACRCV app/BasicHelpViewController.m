//
//  BasicHelpViewController.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "BasicHelpViewController.h"
#import "BasicHelpCell.h"
#import "BasicHelp.h"

@implementation BasicHelpViewController

- (BasicHelp *)skillAtIndexPath:(NSIndexPath *)indexPath {
    NSArray * allBasicHelp = [BasicHelp allBasicHelp];
    BasicHelp *help = [allBasicHelp objectAtIndex:indexPath.row];
    return help;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [BasicHelp quantityOfBasicHelp];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BasicHelpCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BasicHelpCell" forIndexPath:indexPath];
    BasicHelp* help = [self skillAtIndexPath:indexPath];
    cell.BHBackgroundImage.image = help.backgroundImage;
    cell.BHTextView.text = help.text;
    cell.BHTitleLabel.text = help.title;
    return cell;
}

@end
