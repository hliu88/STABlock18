#import <UIKit/UIKit.h>
#import "LongTermViewController.h"

@interface LTPageViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *ltPageViewController;

@property (strong, nonatomic) NSArray *pageCalendarImages;

@end
