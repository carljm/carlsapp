#import "HomeController.h"
#import "APIClient.h"


@implementation HomeController

- (id)initWithAPIClient:(APIClient *)apiClient
{
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(didTapNextButton:)];
    self.title = @"Home";
}

- (IBAction)didTapTalkButton:(id)sender
{
    UIAlertView *nameAlertView = [[UIAlertView alloc] initWithTitle:@"Welcome!"
                                                            message:[NSString stringWithFormat:@"Hello there, %@", self.nameTextField.text]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
    [nameAlertView show];
}

- (IBAction)didTapNextButton:(id)sender
{
    UIViewController *aboutController = [[UIViewController alloc] init];
    aboutController.title = @"About";
    [self.navigationController pushViewController:aboutController animated:YES];
}

- (IBAction)didTapRepositoriesButton:(id)sender {
    [self.apiClient get:@"https://api.github.com/users/carljm/repos"
                success:^(NSArray *repositoryList) {
                    [self performSelector:@selector(showAlert:)
                                 onThread:[NSThread mainThread]
                               withObject:repositoryList waitUntilDone:NO];
                }];
}

- (void)showAlert:(NSArray *)repositoryNames
{
    NSArray *names = [repositoryNames valueForKey:@"full_name"] ;
    NSString *message = [names componentsJoinedByString:@"\n"];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your repos:"
                                                    message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
