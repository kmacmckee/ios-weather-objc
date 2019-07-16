//
//  KTMWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "KTMWeatherViewController.h"
#import "KTMWeatherCollectionViewCell.h"
#import "KTMWeather.h"

@interface KTMWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation KTMWeatherViewController

- (void)updateViews {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self collectionView] reloadData];
        _cityNameLabel.text = _weatherController.cityName;
    });
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _weatherController = [[KTMWeatherController alloc] init];
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _weatherController = [[KTMWeatherController alloc] init];
    }
    
    return self;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.weatherController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KTMWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    KTMWeather *weather = self.weatherController.forecasts[indexPath.item];
    cell.weather = weather;
    [cell updateViews];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.weatherController fetchForecast:searchBar.text completionBlock:^(NSArray * _Nonnull forecasts, NSError * _Nonnull error) {
        [self updateViews];
    }];
    
}



@end
