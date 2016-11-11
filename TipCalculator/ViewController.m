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

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *displayLabelTotal;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

- (IBAction)CalculateTipButtonPushed:(UIButton *)sender
{
    float billAmt = self.billTextField.text.integerValue;
    float tipPercent = self.tipTextField.text.integerValue;
    
    float tipAmount = (tipPercent / 100) * billAmt;
    float totalAmount = tipAmount + billAmt;
    
    self.displayLabel.text = [NSString stringWithFormat:@"You should tip $%.2f", tipAmount];
    self.displayLabelTotal.text = [NSString stringWithFormat:@"Your total is: $%.2f", totalAmount];

}

- (void)dismissKeyboard:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
