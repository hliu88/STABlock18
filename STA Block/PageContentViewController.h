#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *scheduleImageView;

@property (weak, nonatomic) IBOutlet UIImageView *lineSpacerView;

@property (weak, nonatomic) IBOutlet UILabel *dayLabel; // Which schedule day is it

@property (weak, nonatomic) IBOutlet UILabel *dowLabel; // What day of the week is it

@property (weak, nonatomic) IBOutlet UILabel *dateLabel; // What is the numerical date

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property NSUInteger pageIndex;
@property NSString *dayLabelText;
@property NSString *scheduleImageFile;
@property (strong, nonatomic) NSArray *scheduleNumbers;


@end
