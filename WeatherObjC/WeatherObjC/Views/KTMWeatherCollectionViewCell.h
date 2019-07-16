//
//  IIIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTMWeather;

NS_ASSUME_NONNULL_BEGIN

@interface KTMWeatherCollectionViewCell : UICollectionViewCell

- (void)updateViews;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;


@property KTMWeather *weather;


@end

NS_ASSUME_NONNULL_END
