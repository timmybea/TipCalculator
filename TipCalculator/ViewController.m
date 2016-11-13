//
//  ViewController.m
//  TipCalculator
//
//  Created by Tim Beals on 2016-11-11.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tipTextField;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@property (nonatomic) float tipAmount;
@property (nonatomic) float tipPercentage;
@property (nonatomic) float billAmount;
@property (nonatomic) float totalAmount;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

- (IBAction)CalculateTipButtonPushed:(UIButton *)sender
{
    self.billAmount = self.billTextField.text.integerValue;
    self.tipPercentage = self.tipTextField.text.integerValue;
    
    self.tipAmount = (self.tipPercentage / 100) * self.billAmount;
    self.totalAmount = self.tipAmount + self.billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", self.tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalAmount];
    
    self.billTextField.text = @"";
    self.tipTextField.text = @"";

}

- (void)dismissKeyboard:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

- (IBAction)sliderChangedValue:(UISlider *)sender
{
    self.billAmount = self.billTextField.text.integerValue;

    if(self.billAmount > 0)
    {
        self.tipAmount = (self.slider.value / 100) * self.billTextField.text.integerValue;
        self.totalAmount = self.tipAmount + self.billAmount;
        
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", self.tipAmount];
        self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalAmount];
        self.percentageLabel.text = [NSString stringWithFormat:@"%.1f%%", self.slider.value];
    }
    else
    {
        self.percentageLabel.text = @"Please enter bill amount";
    }
}

@end
