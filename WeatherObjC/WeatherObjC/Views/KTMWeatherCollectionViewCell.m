//
//  KTMWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "KTMWeatherCollectionViewCell.h"
#import "KTMWeather.h"


@interface KTMWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation KTMWeatherCollectionViewCell

- (void)updateViews {
    if (self.weather) {
        self.tempLabel.text = [NSString stringWithFormat:@"%@℉", self.weather.temp];
        self.imageView.image = self.weather.icon;
    }
}









@end
