//
//  KTMWeather.h
//  WeatherObjC
//
//  Created by Kobe McKee on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTMWeather : NSObject

@property NSString *cityName;
@property NSNumber *temp;
@property UIImage *icon;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary cityName:(NSString *)cityName;
- (instancetype)initWithName:(NSString *)cityName icon:(UIImage *)icon temp:(NSNumber *)temp;

@end

NS_ASSUME_NONNULL_END
