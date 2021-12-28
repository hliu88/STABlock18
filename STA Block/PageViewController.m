#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithStatusCover"]];
    
    _pageDayLabels = @[@"No School", @"Day A", @"Day B", @"Day C", @"Day D", @"Day E", @"Day F", @"Day G", @"Irregular"];
    
    _pageScheduleImages = [NSMutableArray arrayWithObjects: @"", @"scheduleImage_1", @"scheduleImage_2", @"scheduleImage_3", @"scheduleImage_4", @"scheduleImage_5", @"scheduleImage_6", @"scheduleImage_7", @"", nil];
    
    if([[[NSUserDefaults standardUserDefaults] valueForKey:@"currentSchool"] isEqualToString:@"NCS"])
    {
        for (int i = 0; i < 7; i++)
        {
            NSString *currentABlockn = [NSString stringWithFormat:@"%@%d", @"currentABlock", (i + 1)];
            
            if ([[[NSUserDefaults standardUserDefaults] valueForKey:currentABlockn] boolValue])
            {
                _pageScheduleImages[i+1] = [NSString stringWithFormat:@"%@%d%@", @"scheduleImage_", (i + 1), @"a"];
            }
            else
            {
                _pageScheduleImages[i+1] = [NSString stringWithFormat:@"%@%d%@", @"scheduleImage_", (i + 1), @"b"];
            }
        }
        //_pageScheduleImages = [NSMutableArray arrayWithObjects: @"", @"scheduleImage_1a", @"scheduleImage_2a", @"scheduleImage_3a", @"scheduleImage_4a", @"scheduleImage_5a", @"scheduleImage_6a", @"scheduleImage_7a", @"", nil];
        // Turns out NCS didn't do it that way
    }
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    if ([preferences boolForKey:@"useCloudSchedule"])
    {
        [PFCloud callFunctionInBackground:@"scheduleForDate" withParameters:[NSDictionary new] block:^(id result, NSError *error)
         {
             if (!error)
             {
                 _scheduleNumbers = [NSMutableArray arrayWithObjects:result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], nil];
                 
                 // Create page view controller
                 self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViewController"];
                 self.pageViewController.dataSource = self;
                 
                 PageContentViewController *startingViewController = [self viewControllerAtIndex:0 withArray:_scheduleNumbers];
                 NSArray *viewControllers = @[startingViewController];
                 [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
                 
                 // Change the size of page view controller
                 self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                 
                 [self addChildViewController:_pageViewController];
                 [self.view addSubview:_pageViewController.view];
                 [self.pageViewController didMoveToParentViewController:self];
             }
         }];
        [self performSelector:@selector(sendAlertIfProblem) withObject:nil afterDelay:5];
    }
    else
    {
        [self nonParseMethod];
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    
    [self updateTime];
}

- (void)updateTime
{
    [_updateTimer invalidate];
    _updateTimer = nil;
    
    int i = 0;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    
    [DateFormatter setDateFormat:@"MMddyyyy"];
    
    NSDateComponents *todayComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:[NSDate date]];
    NSInteger theDay = [todayComponents day];
    NSInteger theMonth = [todayComponents month];
    NSInteger theYear = [todayComponents year];
    
    // Build an NSDate object for your date using these components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:theDay];
    [components setMonth:theMonth];
    [components setYear:theYear];
    
    NSDate *date1 = [gregorian dateFromComponents:components];
    
    //NSLog(@"User Data Date = %d", [[[NSUserDefaults standardUserDefaults] valueForKey:@"UserDataDate"] intValue]);
    //NSLog(@"Actual Date = %d", [[DateFormatter stringFromDate:date1] intValue]);
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"UserDataDate"] intValue] != [[DateFormatter stringFromDate:date1] intValue])
    {
        //NSLog(@"The Date Changed");
        
        [[NSUserDefaults standardUserDefaults] setInteger:[[DateFormatter stringFromDate:date1] intValue] forKey:@"UserDataDate"];
        
        [self performSegueWithIdentifier:@"refreshSchedule" sender:self];
        i++;
    }
    
    if (i == 0) // Super Intelligent Bug Fix!!! // When not reloading whole thing this is activated
        _updateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"refreshSchedule"])
    {
        [((UITabBarController*)segue.destinationViewController) setSelectedIndex:0];
    }
}

- (void)sendAlertIfProblem
{
    if (_scheduleNumbers[0] == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Too Long!!"
                                                        message:@"\nYou are currently using the \"Cloud Schedule\" mode, which requires intenet connection.  Try turning this option off in the settings tab if the schedule is taking too long to load."
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index withArray:_scheduleNumbers];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    index++;
    if (index == ([self.pageDayLabels count] - 1))
    {
        return nil;
    }
    return [self viewControllerAtIndex:index withArray:_scheduleNumbers];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index withArray:(NSArray *)scheduleNumbers
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithMore"]]];
    
    if ((([self.pageDayLabels count] - 1) == 0) || (index >= ([self.pageDayLabels count] - 2)))
    {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageContentViewController"];
    pageContentViewController.scheduleImageFile = self.pageScheduleImages[[scheduleNumbers[index + 1] intValue]];
    pageContentViewController.dayLabelText = self.pageDayLabels[[scheduleNumbers[index + 1] intValue]];
    pageContentViewController.pageIndex = index;
    pageContentViewController.scheduleNumbers = [NSArray arrayWithObjects:scheduleNumbers[0], scheduleNumbers[1], scheduleNumbers[2], scheduleNumbers[3], scheduleNumbers[4], scheduleNumbers[5], scheduleNumbers[6], scheduleNumbers[7], scheduleNumbers[8], nil];
    
    return pageContentViewController;
}

- (void) nonParseMethod
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    
    [DateFormatter setDateFormat:@"MMddyyyy"];
    
    NSDateComponents *todayComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:[NSDate date]];
    NSInteger theDay = [todayComponents day];
    NSInteger theMonth = [todayComponents month];
    NSInteger theYear = [todayComponents year];
    
    // Build an NSDate object for your date using these components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:theDay];
    [components setMonth:theMonth];
    [components setYear:theYear];
    
    NSDate *date1 = [gregorian dateFromComponents:components];
    
    NSDateComponents *yesterdayoffsetComponents = [[NSDateComponents alloc] init];
    [yesterdayoffsetComponents setDay:-1];
    
    date1 = [gregorian dateByAddingComponents:yesterdayoffsetComponents toDate:date1 options:0];
    
    NSMutableArray *results = [[NSMutableArray alloc] initWithObjects: @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
    
    for (int i = 0; i < 9; i++)
    {
        switch ([[DateFormatter stringFromDate:date1] intValue]) //Which date does it match and what to do depending on the answer
        {
            case 9072017:
            case 9182017:
            case 9282017://a
            case 10112017:
            case 10202017:
            case 11012017:
            case 11132017:
            case 11272017:
            case 12062017:
            case 12152017:
            case 1092018:
            case 1222018:
            case 1312018:
            case 2092018:
            case 2222018:
                // case 3052018:
                // case 3172016:
                //case 4112016:
                // case 4212016:
                //  case 5032016:
                //  case 5122016:
                results[i] = [NSNumber numberWithInt:1];
                break;
            case 9082017:
            case 9192017:
            case 9292017:
            case 10122017:
            case 10232017:
            case 11022017:
            case 11142017://b
            case 11282017:
            case 12072017:
            case 12182017:
            case 1102018:
            case 1232018:
            case 2012018:
            case 2122018:
            case 2232018:
                //   case 3092016:
                //   case 3182016:
                //  case 4132016:
                //  case 4222016:
                //  case 5042016:
                //  case 5132016:
                results[i] = [NSNumber numberWithInt:2];
                break;
            case 9112017:
            case 9202017:
            case 10022017:
            case 10132017:
            case 10242017://c
            case 11062017:
            case 11152017:
            case 11292017:
            case 12082017:
            case 12192017:
            case 1112018:
            case 1242018:
            case 2022018:
            case 2132018:
            case 2262018:
                //     case 3012016:
                //    case 3102016:
                //     case 4042016:
                //   case 4142016:
                //   case 4262016:
                //    case 5052016:
                // case 5162016:
                results[i] = [NSNumber numberWithInt:3];
                break;
            case 9122017:
            case 9212017:
            case 10032017:
            case 10162017:
            case 10252017:
            case 11072017:
            case 11162017:
            case 11302017:
            case 12112017://d
            case 1032018:
            case 1122018:
            case 1252018:
            case 2142018:
            case 2272018:
                // case 2222016:
                //     case 3022016:
                //       case 3112016:
                //case 4052016:
                //  case 4152016:
                //   case 4272016:
                //   case 5062016:
                // case 5172016:
                results[i] = [NSNumber numberWithInt:4];
                break;
            case 9132017:
            case 9252017:
            case 10042017:
            case 10172017:
            case 10262017:
            case 11082017:
            case 11172017:
            case 12012017://e
            case 12122017:
            case 1042018:
            case 1172018:
            case 1262018:
            case 2062018:
            case 2152018:
            case 2282018:
                //case 3032016:
                //   case 3142016:
                //     case 4062016:
                //     case 4182016:
                //    case 4282016:
                //     case 5092016:
                //    case 5182016:
                results[i] = [NSNumber numberWithInt:5];
                break;
            case 9142017:
            case 9262017:
            case 10052017:
            case 10182017:
            case 10302017:
            case 11092017:
            case 11202017:
            case 12042017://f
            case 12132017:
            case 1052018:
            case 1182018:
            case 1292018:
            case 2072018:
            case 2202018:
                //   case 3042016:
                //      case 3152016:
                //       case 4072016:
                //        case 4192016:
                //         case 4292016:
                //       case 5102016:
                //       case 5192016:
                results[i] = [NSNumber numberWithInt:6];
                break;
            case 9152017:
            case 9272017:
            case 10102017:
            case 10192017://g
            case 10312017:
            case 11102017:
            case 11212017:
            case 12052017:
            case 12142017:
            case 1082018:
            case 1192018:
            case 1302018:
            case 2082018:
            case 2212018:
                //      case 3072016:
                //       case 3162016:
                //         case 4082016:
                //         case 4202016:
                //         case 5022016:
                //        case 5112016:
                //          case 5202016:
                results[i] = [NSNumber numberWithInt:7];
                break;
            case 9012015:
            case 9252015:
                results[i] = [NSNumber numberWithInt:8];
                break;
            default:
                results[i] = [NSNumber numberWithInt:0];
                break;
        }
        NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
        [offsetComponents setDay:1];
        
        date1 = [gregorian dateByAddingComponents:offsetComponents toDate:date1 options:0];
    }
    
    _scheduleNumbers = [NSMutableArray arrayWithObjects:results[0], results[1], results[2], results[3], results[4], results[5], results[6], results[7], results[8], nil];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0 withArray:_scheduleNumbers];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

/*
 - (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
 {
 return [self.pageDayLabels count];
 }
 
 - (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
 {
 return 0;
 }
 */  // Shows dot menu to represent pages


@end
