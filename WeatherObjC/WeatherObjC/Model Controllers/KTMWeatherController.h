//
//  KTMWeatherController.h
//  WeatherObjC
//
//  Created by Kobe McKee on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^KTMFetchForecastCompletionBlock)(NSArray *, NSError *);


@interface KTMWeatherController : NSObject

@property NSArray *forecasts;
@property NSString *cityName;


- (void)fetchForecast:(NSString *)zipcode
      completionBlock:(KTMFetchForecastCompletionBlock)completionBlock;



@end

NS_ASSUME_NONNULL_END
