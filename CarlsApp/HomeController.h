#import <UIKit/UIKit.h>


@class APIClient;


@interface HomeController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *talkButton;
@property (weak, nonatomic) IBOutlet UIButton *showRepositoriesButton;

@property (strong, nonatomic) APIClient *apiClient;

- (id)initWithAPIClient:(APIClient *)apiClient;

@end
