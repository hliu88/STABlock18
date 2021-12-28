#import "LTPageViewController.h"

@interface LTPageViewController ()

@end

@implementation LTPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create page view controller
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithStatusCover"]];
    
    _pageCalendarImages = @[@"septemberCalendar", @"octoberCalendar", @"novemberCalendar", @"decemberCalendar", @"januaryCalendar", @"februaryCalendar"];
    
    // Other names to be implemented in the future
    
    /* @"septemberCalendar", @"octoberCalendar", @"novemberCalendar", @"decemberCalendar", @"januaryCalendar", @"februaryCalendar", @"marchCalendar", @"aprilCalendar", @"mayCalendar" */
    
    self.ltPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ltPageViewController"];
    self.ltPageViewController.dataSource = self;
    
    //Debugging from april 2015 problem (Decreasing _pageCalendarImages size)
    /*
    NSLog(@"Current Value: %d", [[[NSUserDefaults standardUserDefaults] valueForKey:@"calendarPageIndex"] intValue]);
    NSLog(@"Num Calendars: %d", (int)[_pageCalendarImages count]);
    */
    
    // In case calendarPageIndex is > size of _pageCalendarImages (Prevents ArrayOutOfBounds Exception)
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"calendarPageIndex"] intValue] >= (int)[_pageCalendarImages count])
    {
        [[NSUserDefaults standardUserDefaults] setValue:0 forKey:@"calendarPageIndex"];
        //NSLog(@"Exectuing");
    }
    
    LongTermViewController *startingViewController = [self viewControllerAtIndex:[[[NSUserDefaults standardUserDefaults] valueForKey:@"calendarPageIndex"] intValue]];
    NSArray *ltViewControllers = @[startingViewController];
    [self.ltPageViewController setViewControllers:ltViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.ltPageViewController.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    
    [self addChildViewController:_ltPageViewController];
    [self.view addSubview:_ltPageViewController.view];
    [self.ltPageViewController didMoveToParentViewController:self];
    
    // Do any additional setup after loading the view.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    //NSUInteger index = [[NSUserDefaults standardUserDefaults] integerForKey:@"longTermViewPageIndex"];
    NSUInteger index = ((LongTermViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    //NSUInteger index = [[NSUserDefaults standardUserDefaults] integerForKey:@"longTermViewPageIndex"];
    NSUInteger index = ((LongTermViewController*) viewController).pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    index++;
    
    if (index == [self.pageCalendarImages count])
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (LongTermViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if ((([self.pageCalendarImages count]) == 0) || (index >= ([self.pageCalendarImages count])))
    {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    LongTermViewController *longTermViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ltPageContentViewController"];
    longTermViewController.calendarImageFile = self.pageCalendarImages[index];
    longTermViewController.pageIndex = index;
    
    return longTermViewController;
}


@end
