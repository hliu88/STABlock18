#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
#import <Parse/Parse.h>

@interface PageViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageDayLabels;
@property (strong, nonatomic) NSMutableArray *pageScheduleImages;
@property (strong, nonatomic) NSMutableArray *scheduleNumbers;
@property (strong, nonatomic) NSTimer *updateTimer;


@end
