#import <UIKit/UIKit.h>

@interface LongTermViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *calendarImageView;

@property NSString *calendarImageFile;

@property NSUInteger pageIndex;

- (IBAction)aButtonPressed:(UIButton *)sender;
- (IBAction)bButtonPressed:(UIButton *)sender;
- (IBAction)cButtonPressed:(UIButton *)sender;
- (IBAction)dButtonPressed:(UIButton *)sender;
- (IBAction)eButtonPressed:(UIButton *)sender;
- (IBAction)fButtonPressed:(UIButton *)sender;
- (IBAction)gButtonPressed:(UIButton *)sender;


@end
