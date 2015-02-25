//
//  ViewController.h
//  DatePicker
//
//  Created by mspsys087 on 2/23/15.
//  Copyright (c) 2015 mspsys087. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate , UITextFieldDelegate>

{
    UIDatePicker *datePickerView;
    UIView       *viewBack;
}

@property (strong, nonatomic) UIView *pickerView;
@property (nonatomic ,retain) IBOutlet UITextField *txtDate;

-(void)DatePickUp;





@end

