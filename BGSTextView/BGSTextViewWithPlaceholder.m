//
//  BGSTextViewWithPlaceholder.m
//  BGSTextViewWithPlaceholder
//
//  Created by Peter Todd Air on 30/08/2014.
//  Copyright (c) 2014 Bright Green Star. All rights reserved.
//

#import "BGSTextViewWithPlaceholder.h"

@interface BGSTextViewWithPlaceholder ()
    @property (strong, nonatomic) UILabel *lblPlaceholder;
@end

@implementation BGSTextViewWithPlaceholder
@synthesize strPlaceholder = _strPlaceholder;


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configTextView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configTextView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)configTextView
{
    // Test
    /*
    if (!self.strPlaceholder)
    {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"TEST LABEL but very long but very long but very long but very long but very long but very long ."];
        [str addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(2,2)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(7,1)];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(6, 2)];
        [self setStrPlaceholder:str];
    }
     */

    
    
    
    if (self.strPlaceholder)
    {
        [self configNotifications];
        [self configLabel];

        
    }
}

-(void)configNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(textDidChange:)
                          name:UITextViewTextDidChangeNotification object:self];
    
    [notificationCenter addObserver:self selector:@selector(editDidBegin:)
                               name:UITextViewTextDidBeginEditingNotification object:self];
    
    
    [notificationCenter addObserver:self selector:@selector(editDidEnd:)
                               name:UITextViewTextDidEndEditingNotification object:self];

    
}


- (void)textDidChange:(NSNotification *)notification
{
    [self.lblPlaceholder removeFromSuperview];
}

- (void)editDidBegin:(NSNotification *)notification
{
    [self.lblPlaceholder removeFromSuperview];
}

- (void)editDidEnd:(NSNotification *)notification
{
    if (self.text.length > 0)
    {
        [self.lblPlaceholder removeFromSuperview];
        return;
    }else
    {
        [self configLabel];
    }
    
}


-(void)configLabel
{
    if (self.text.length > 0)
    {
        [self.lblPlaceholder removeFromSuperview];
        return;
    }
    CGRect frameLbl = self.bounds;
    int heightLbl = frameLbl.size.height;
    int widthlbl = frameLbl.size.width;
    if (self.intHeight > 0)
    {
        heightLbl = self.intHeight;
    }
    if (self.intWidth > 0)
    {
        widthlbl = self.intWidth;
    }
    // Set the placeholder poistion.
    CGRect frameLblUpd = CGRectMake(frameLbl.origin.x, frameLbl.origin.y, widthlbl, heightLbl);
    self.lblPlaceholder = [[UILabel alloc]initWithFrame:frameLblUpd];


    // Default the text color but will be updated by Attributed string properties
    [self.lblPlaceholder setTextColor:[UIColor lightGrayColor]];
    
    // Number of Line
    if (self.intLines > 1)
    {
        [self.lblPlaceholder setNumberOfLines:self.intLines];
    }

    [self.lblPlaceholder setAttributedText:[self strPlaceholder]];
  //  [self setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.lblPlaceholder];
    
    
    // We need to position the label
    // We will set to same frame size as TV
    // and then display text in center
}

// Custom setter to show label if neccessary
-(void)setStrPlaceholder:(NSAttributedString *)strPlaceholder
{
   _strPlaceholder = strPlaceholder;

    [self configTextView];
}



@end
