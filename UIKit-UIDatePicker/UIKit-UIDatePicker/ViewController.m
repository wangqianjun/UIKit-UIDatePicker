//
//  ViewController.m
//  UIKit-UIDatePicker
//
//  Created by 王钱钧 on 14-10-9.
//  Copyright (c) 2014年 王钱钧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *myPickerView;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self localeFuc];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method

- (void)initView
{
    _myDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    _myPickerView.dataSource = self;
    _myPickerView.delegate = self;
    
}

- (void)localeFuc
{
    NSLocale *localeEn = _myDatePicker.locale;
    
    id quotationBegin = [localeEn objectForKey:NSLocaleQuotationBeginDelimiterKey];
    id quotationEnd = [localeEn objectForKey:NSLocaleQuotationEndDelimiterKey];
    id localeIdentifier = [localeEn objectForKey:NSLocaleIdentifier];
    id localeLanguageCode = [localeEn objectForKey:NSLocaleLanguageCode];
    id localeCountryCode = [localeEn objectForKey:NSLocaleCountryCode];
    id localeScriptCode = [localeEn objectForKey:NSLocaleScriptCode];
    id localeVariantCode = [localeEn objectForKey:NSLocaleVariantCode];
    
    NSLog(@"locale quotation begin = %@", quotationBegin);
    NSLog(@"locale quotation end = %@",quotationEnd);
    NSLog(@"locale identifier = %@", localeIdentifier);
    NSLog(@"locale language code = %@", localeLanguageCode);
    NSLog(@"locale country code = %@", localeCountryCode);
    NSLog(@"locale script code = %@", localeScriptCode);
    NSLog(@"locale varient code = %@", localeVariantCode);
    NSLog(@"Sum = %0.f",Sum(1, 2));
    
    
    NSLocale *cnLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
//    NSLocale *currentLocale = [NSLocale systemLocale];
//    NSLog(@"currentLocale identifier = %@", [currentLocale objectForKey:NSLocaleIdentifier]);
    
    _myDatePicker.locale = cnLocale;
    
    NSLog(@"preferredLangage = %@",[[NSLocale preferredLanguages] componentsJoinedByString:@", "]);
    NSLog(@"fr_FR: %@", [cnLocale displayNameForKey:NSLocaleIdentifier value:@"fr_FR"]);
    NSLog(@"en_US: %@", [cnLocale displayNameForKey:NSLocaleIdentifier value:@"en_US"]);
    
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return self.view.bounds.size.width / 3.f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"picker";
}


//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 25)];
        view.backgroundColor = [UIColor redColor];
    }
    
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"selected row: %d, conponent: %d",row,component);
}
@end
