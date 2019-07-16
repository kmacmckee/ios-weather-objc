//
//  KTMWeather.m
//  WeatherObjC
//
//  Created by Kobe McKee on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "KTMWeather.h"

@implementation KTMWeather


- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)cityName {
    
    NSString *iconName = [dictionary[@"weather"] objectAtIndex:0][@"icon"];
    UIImage *icon = [UIImage imageNamed:iconName];
    
    NSNumber *temp = dictionary[@"main"][@"temp"];
    
    return [self initWithName:cityName icon:icon temp:temp];
}

- (instancetype)initWithName:(NSString *)cityName icon:(UIImage *)icon temp:(NSNumber *)temp {
    self = [super init];
    if (self) {
        _cityName = cityName;
        _icon = icon;
        _temp = temp;
    }
    return self;
}

@end
