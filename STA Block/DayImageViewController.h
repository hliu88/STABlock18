#import <UIKit/UIKit.h>

@interface DayImageViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *dayOfImage;

@property (weak, nonatomic) IBOutlet UIButton *goBackButton;

@property (weak, nonatomic) IBOutlet UIImageView *scheduleImageView;

@property (strong, nonatomic) NSMutableArray *pageScheduleImages;

- (IBAction)goBack;

@end
