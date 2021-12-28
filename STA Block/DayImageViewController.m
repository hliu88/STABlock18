#import "DayImageViewController.h"

@interface DayImageViewController ()

@end

@implementation DayImageViewController

//@synthesize scrollLocation = _scrollLocation;
@synthesize pageScheduleImages = _pageScheduleImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //DayImageViewController *dayImageViewController = [[DayImageViewController alloc] initWithNibName:@"DayImageViewController" bundle:nil];
    
    if ([[UIScreen mainScreen] bounds].size.height != 568)
    {
        self.scrollView.frame = CGRectMake(0, 0, 320, 480);
        self.scrollView.contentSize = CGSizeMake(320, 568);
        [_scrollView setScrollEnabled:YES];
        [_scrollView setShowsVerticalScrollIndicator:YES];
    }
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackgroundWithStatusCover"]]];
    
    self.goBackButton.titleLabel.font = [UIFont fontWithName:@"Impact" size:22];
    [self.goBackButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
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
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *day = [user stringForKey:@"Day"];
    NSString *dayInCalendar = [user stringForKey:@"DayInCalendar"];
    NSString *period1Class = [user stringForKey:@"currentPeriod1"];
    NSString *period2Class = [user stringForKey:@"currentPeriod2"];
    NSString *period3Class = [user stringForKey:@"currentPeriod3"];
    NSString *period4Class = [user stringForKey:@"currentPeriod4"];
    NSString *period5Class = [user stringForKey:@"currentPeriod5"];
    NSString *period6Class = [user stringForKey:@"currentPeriod6"];
    NSString *ensemble = [user stringForKey:@"currentEnsemble"];
    
    self.dayOfImage.font = [UIFont fontWithName:@"Impact" size:28];
    [self.dayOfImage setTextColor:[UIColor whiteColor]];
    self.dayOfImage.text = dayInCalendar;
    
    // A bunch of pre initiated bools to make the if statements cleaner
    bool attendSTA = [[user valueForKey:@"currentSchool"] isEqualToString:@"STA"];
    bool currentABlock1 = [user boolForKey:@"currentABlock1"];
    bool currentABlock2 = [user boolForKey:@"currentABlock2"];
    bool currentABlock3 = [user boolForKey:@"currentABlock3"];
    bool currentABlock4 = [user boolForKey:@"currentABlock4"];
    bool currentABlock5 = [user boolForKey:@"currentABlock5"];
    bool currentABlock6 = [user boolForKey:@"currentABlock6"];
    bool currentABlock7 = [user boolForKey:@"currentABlock7"];
    bool dayA = [day isEqualToString:@"A"];
    bool dayB = [day isEqualToString:@"B"];
    bool dayC = [day isEqualToString:@"C"];
    bool dayD = [day isEqualToString:@"D"];
    bool dayE = [day isEqualToString:@"E"];
    bool dayF = [day isEqualToString:@"F"];
    bool dayG = [day isEqualToString:@"G"];
    
    if (dayA)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock1) changingPosition = 252;
        else changingPosition = 286;
        
        UIImage *dayASchedule = [self drawText1:period1Class
                                      drawText2:period2Class
                                      drawText3:period3Class
                                      drawText4:period4Class
                                      drawText5:period5Class
                                      drawText6:nil
                                      drawText7:nil
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[1]]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:183
                                       atPoint4:changingPosition
                                       atPoint5:355
                                       atPoint6:0
                                       atPoint7:CGPointMake(0, 0)];
        [self drawImage:dayASchedule];
    }
    else if (dayB)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock2) changingPosition = 252;
        else changingPosition = 286;
        
        UIImage *dayBSchedule = [self drawText1:period6Class
                                      drawText2:period1Class
                                      drawText3:period2Class
                                      drawText4:period3Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[2]]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(-45, 155)];
        [self drawImage:dayBSchedule];
        
    }
    else if (dayC)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock3) changingPosition = 218;
        else changingPosition = 253;
        
        UIImage *dayCSchedule = [self drawText1:period4Class
                                      drawText2:period5Class
                                      drawText3:period6Class
                                      drawText4:period1Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:nil
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[3]]
                                       atPoint1:23
                                       atPoint2:150
                                       atPoint3:changingPosition
                                       atPoint4:321
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(0,0)];
        [self drawImage:dayCSchedule];
    }
    else if (dayD)
    {
        int changingPosition;
        
        if (attendSTA || currentABlock4) changingPosition = 252;
        else changingPosition = 286;
        
        UIImage *dayDSchedule = [self drawText1:period2Class
                                      drawText2:period3Class
                                      drawText3:period4Class
                                      drawText4:period5Class
                                      drawText5:period6Class
                                      drawText6:nil
                                      drawText7:nil
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[4]]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:183
                                       atPoint4:changingPosition
                                       atPoint5:355
                                       atPoint6:0
                                       atPoint7:CGPointMake(0, 0)];
        [self drawImage:dayDSchedule];
    }
    else if (dayE)
    {
        int changingPosition;
        int changingXValue;
        
        if (attendSTA || currentABlock5)
        {
            changingPosition = 252;
            changingXValue = -45;
        }
        else
        {
            changingPosition = 286;
            changingXValue = 0;
        }
        
        UIImage *dayESchedule = [self drawText1:period1Class
                                      drawText2:period2Class
                                      drawText3:period3Class
                                      drawText4:period4Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[5]]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(changingXValue, 189)];
        [self drawImage:dayESchedule];
    }
    else if (dayF)
    {
        int changingPosition;
        int changingXValue;
        
        if (attendSTA || currentABlock6) changingPosition = 252;
        else changingPosition = 286;
        
        if ([ensemble isEqualToString:@"Ensemble"]) changingXValue = 45;
        else changingXValue = 30;
        
        UIImage *dayFSchedule = [self drawText1:period5Class
                                      drawText2:period6Class
                                      drawText3:period1Class
                                      drawText4:period2Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[6]]
                                       atPoint1:80
                                       atPoint2:149
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(changingXValue, 18)];
        [self drawImage:dayFSchedule];
    }
    else if (dayG)
    {
        int changingPosition;
        int changingXValue;
        
        if (attendSTA || currentABlock7)
        {
            changingPosition = 252;
            changingXValue = -45;
        }
        else
        {
            changingPosition = 286;
            changingXValue = 0;
        }
        
        UIImage *dayGSchedule = [self drawText1:period3Class
                                      drawText2:period4Class
                                      drawText3:period5Class
                                      drawText4:period6Class
                                      drawText5:nil
                                      drawText6:nil
                                      drawText7:ensemble
                                        inImage:[UIImage imageNamed:self.pageScheduleImages[7]]
                                       atPoint1:23
                                       atPoint2:90
                                       atPoint3:changingPosition
                                       atPoint4:355
                                       atPoint5:0
                                       atPoint6:0
                                       atPoint7:CGPointMake(changingXValue, 189)];
        [self drawImage:dayGSchedule];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *) drawText1:(NSString*) period1
              drawText2:(NSString*) period2
              drawText3:(NSString*) period3
              drawText4:(NSString*) period4
              drawText5:(NSString*) period5
              drawText6:(NSString*) period6
              drawText7:(NSString*) ensemble
                inImage:(UIImage*) image
               atPoint1:(int) point1
               atPoint2:(int) point2
               atPoint3:(int) point3
               atPoint4:(int) point4
               atPoint5:(int) point5
               atPoint6:(int) point6
               atPoint7:(CGPoint) point

{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    
    CGRect rect1 = CGRectMake(0, point1, image.size.width, image.size.height);
    CGRect rect2 = CGRectMake(0, point2, image.size.width, image.size.height);
    CGRect rect3 = CGRectMake(0, point3, image.size.width, image.size.height);
    CGRect rect4 = CGRectMake(0, point4, image.size.width, image.size.height);
    CGRect rect5 = CGRectMake(0, point5, image.size.width, image.size.height);
    CGRect rect6 = CGRectMake(0, point6, image.size.width, image.size.height);
    CGRect rect7 = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    
    UIFont *font = [UIFont fontWithName:@"Impact" size:15];
    
    // Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    // Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    // Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    [period1 drawInRect:CGRectIntegral(rect1) withAttributes:attributes];
    [period2 drawInRect:CGRectIntegral(rect2) withAttributes:attributes];
    [period3 drawInRect:CGRectIntegral(rect3) withAttributes:attributes];
    [period4 drawInRect:CGRectIntegral(rect4) withAttributes:attributes];
    [period5 drawInRect:CGRectIntegral(rect5) withAttributes:attributes];
    [period6 drawInRect:CGRectIntegral(rect6) withAttributes:attributes];
    [ensemble drawInRect:CGRectIntegral(rect7) withAttributes:attributes];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void) drawImage:(UIImage *) scheduleImage
{
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(self.scheduleImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:self.scheduleImageView.bounds
                                cornerRadius:10.0] addClip];
    // Draw your image
    [scheduleImage drawInRect:self.scheduleImageView.bounds];
    
    // Get the image, here setting the UIImageView image
    self.scheduleImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
}

- (IBAction)goBack
{
    [self performSegueWithIdentifier:@"returnFromDayImage" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"returnFromDayImage"])
    {
        [((UITabBarController*)segue.destinationViewController) setSelectedIndex:1];
        
        /*
         LongTermViewController *longTermViewController = [[LongTermViewController alloc] initWithNibName:@"LongTermViewController" bundle:nil];
         
         longTermViewController.scrollLocationX = [NSNumber numberWithInt:[_scrollLocationX intValue]];
         longTermViewController.scrollLocationY = [NSNumber numberWithInt:[_scrollLocationY intValue]];
         
         NSLog(@"Test 5 (x, y) %@ %@", longTermViewController.scrollLocationX, longTermViewController.scrollLocationY);
         */
    }
}


@end
