//
//  ViewController.m
//  DatePicker
//
//  Created by mspsys087 on 2/23/15.
//  Copyright (c) 2015 mspsys087. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    
    
    datePickerView = [[UIDatePicker alloc] init];
    datePickerView.datePickerMode = UIDatePickerModeDateAndTime;
    datePickerView.minimumDate = [NSDate date];
    [datePickerView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)DatePickUp
{
    viewBack = [[UIView alloc] initWithFrame:self.view.frame];
    [viewBack setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:viewBack];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBehind:)];
    [recognizer setNumberOfTapsRequired:1];
    recognizer.delegate = self;
    recognizer.cancelsTouchesInView = NO; //So the user can still interact with controls in the modal view
    [viewBack addGestureRecognizer:recognizer];
    
    
    UIToolbar *controlToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    [controlToolbar sizeToFit];
    
    UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [infoButton setFrame:CGRectMake(0, 0, 30, 30)];
    [infoButton setTitle:@"Set" forState:UIControlStateNormal];
    //[infoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(dismissDateSet) forControlEvents:UIControlEventTouchDown];
    
    UIBarButtonItem *setButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    
    UIBarButtonItem *spacer1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *Choosedate = [[UIBarButtonItem alloc] initWithTitle:@"Choose Date" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    Choosedate.tintColor = [UIColor redColor];
    
    UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIButton* infoButtonCancel = [UIButton buttonWithType:UIButtonTypeSystem];
    [infoButtonCancel setFrame:CGRectMake(0, 0, 50, 30)];
    [infoButtonCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    //[infoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [infoButtonCancel addTarget:self action:@selector(cancelDateSet) forControlEvents:UIControlEventTouchDown];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithCustomView:infoButtonCancel];
    
    [controlToolbar setItems:[NSArray arrayWithObjects:cancelButton, spacer1 , Choosedate ,spacer2 ,setButton, nil] animated:NO];
    
    
    [datePickerView setFrame:CGRectMake(0, 40, self.view.frame.size.width,300)];
    
    if (!self.pickerView) {
        self.pickerView = [[UIView alloc] initWithFrame:datePickerView.frame];
    } else {
        [self.pickerView setHidden:NO];
    }
    
    
    [self.pickerView setFrame:CGRectMake(0,
                                         self.view.frame.size.height,
                                         self.view.frame.size.width,
                                         250)];
    [self.pickerView setBackgroundColor:[UIColor whiteColor]];
    [self.pickerView addSubview:controlToolbar];
    [self.pickerView addSubview:datePickerView];
    [datePickerView setHidden:NO];
    
    [viewBack addSubview:self.pickerView];
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.pickerView setFrame:CGRectMake(0,
                                                              self.view.frame.size.height - self.pickerView.frame.size.height,
                                                              self.view.frame.size.width,
                                                              250)];
                     }
                     completion:nil];
    

}
- (void)handleTapBehind:(UITapGestureRecognizer *)sender
{
    [viewBack removeGestureRecognizer:sender];
    [self cancelDateSet];
}
-(void)dismissDateSet
{
    [UIView animateWithDuration:0.5 animations:^{
        [_pickerView setFrame:CGRectMake(_pickerView.frame.origin.x,
                                         self.view.frame.size.height,
                                         _pickerView.frame.size.width,
                                         _pickerView.frame.size.height)];
    } completion:^(BOOL finished) {
        [viewBack removeFromSuperview];
    }];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    self.txtDate.text = [dateFormatter stringFromDate:datePickerView.date];

}
-(void)cancelDateSet{
    
    [UIView animateWithDuration:0.5 animations:^{
        [_pickerView setFrame:CGRectMake(_pickerView.frame.origin.x,
                                         self.view.frame.size.height,
                                         _pickerView.frame.size.width,
                                         _pickerView.frame.size.height)];
    } completion:^(BOOL finished) {
        [viewBack removeFromSuperview];
    }];
    
}

#pragma mark - Textfield delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.txtDate resignFirstResponder];
    [self DatePickUp];
}


@end
