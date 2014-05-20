//
//  TextStatsViewController.m
//  Attributor
//
//  Created by ShaoLing on 4/19/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorCharLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharLabel;

@end

@implementation TextStatsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}



- (NSAttributedString *)charWithAttribute:(NSString *)attributeName {
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    NSRange range;
    
    while (index < [self.textToAnalyze length]){
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else {
            index++;
        }
    }
    
    return characters;
}

- (void)updateUI {
    self.colorCharLabel.text = [NSString stringWithFormat:@"%d colorful char", [[self charWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.outlineCharLabel.text =[NSString stringWithFormat:@"%d outline char", [[self charWithAttribute:NSStrokeWidthAttributeName] length]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
