//
//  KTMWeatherController.m
//  WeatherObjC
//
//  Created by Kobe McKee on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "KTMWeatherController.h"
#import "KTMWeather.h"

@implementation KTMWeatherController

static NSString const *baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString const *apiKey = @"ec99ca74f04730540bf82f489d4718a9";

- (instancetype)init {
    self = [super init];
    if (self) {
        _forecasts = @[];
    }

    return self;
}


- (void)fetchForecast:(NSString *)zipcode
      completionBlock:(KTMFetchForecastCompletionBlock)completionBlock {
    
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"zip" value:zipcode],
                            [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"],
                            [NSURLQueryItem queryItemWithName:@"appid" value:apiKey]
                            ];
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching forecast: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        NSArray *list = json[@"list"];
        NSString *cityName = json[@"city"][@"name"];
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *result in list) {
            KTMWeather *weather = [[KTMWeather alloc] initWithDictionary:result cityName:cityName];
            
            [forecasts addObject:weather];
            
            self.forecasts = forecasts;
            self.cityName = cityName;
        }
        
        completionBlock(forecasts, nil);
    }];
    [task resume];
    
}



@end
