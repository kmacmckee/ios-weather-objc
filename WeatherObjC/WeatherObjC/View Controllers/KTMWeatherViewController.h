//
//  KTMWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTMWeatherController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KTMWeatherViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>

@property KTMWeatherController *weatherController;


@end

NS_ASSUME_NONNULL_END
