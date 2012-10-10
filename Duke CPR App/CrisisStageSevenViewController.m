#import "CrisisStageSevenViewController.h"
#define STAGE_SEVEN_TEXT @"Continue to the sound of the beat to save a life"

@interface CrisisStageSevenViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CrisisStageSevenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
    [self addGestureRecognizer];
    
	
}

- (void)setUpTextView
{
    self.textView.text = STAGE_SEVEN_TEXT;
    
}

- (IBAction)doneButtonPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)viewDidUnload {
    [self setTextView:nil];
    [super viewDidUnload];
}

-(void) addGestureRecognizer
{
    UIPanGestureRecognizer *pan;
    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
    [pan setMinimumNumberOfTouches:1];
    [self.view addGestureRecognizer:pan];
}


-(void) swipeRecognized: (UIPanGestureRecognizer  *) recognizer
{
    if(recognizer.state != UIGestureRecognizerStateBegan) return;
    CGPoint velocity = [recognizer velocityInView:self.view];
    if(velocity.x > 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        //[self performSegueWithIdentifier:@"Step1Segue" sender:self];
    }
}



-(void) backSwipeRecognized
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
