![Build Status](https://travis-ci.org/DenHeadless/DTRequestVerifier.png?branch=master) &nbsp;
![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)
DTPickerPresenter
=================

DTPickerPresenter is easy and modern wrapper for UIDatePicker and UIPickerView. It provides easy way to present UIDatePicker and UIPickerView both on iPhone and iPad with very little amount of code.

## UIDatePicker 

#### iPhone

Many times i've looked at UITextField keyboard options in Interface Builder, and wondered, why there are no Date Picker keyboard? UIDatePicker API is great, but it's missing one little step i'm trying to take here.

Let's see how you would use UIDatePicker with UITextField conventionally

```objective-c
@interface iPhonePickerController () 
@property (weak, nonatomic) IBOutlet UITextField * datePickerTextField;
@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) UIDatePicker * picker;
@end

- (void)setupDatePickerForTextField:(UITextField *)field
{
    self.picker = [UIDatePicker new];
    [self.picker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    field.inputView = self.picker;
}

- (void)datePickerValueChanged:(UIDatePicker *)datePicker
{
    if ([datePicker isEqual:self.picker])
    {
        self.date = datePicker.date;
    }
}

-(void)cleanupDatePicker
{
    [self.picker removeTarget:self action:NULL forControlEvents:UIControlEventValueChanged];
}
```

Phew! That's a lot of code for a simple UIDatePicker, let's see what DTPickerPresenter has to offer here.


```objective-c
__weak typeof (self) weakSelf = self;
DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate) {
    // Probably format with locale and time zones?
}];
[self.datePickerTextField dt_setPresenter:presenter];
```

It's that simple. You just create presenter and attach it to the UITextField, and presenter will do the rest.

#### iPad

Generally, on the iPad, you would want to use UIPopoverController to present UIDatePicker. This includes creating UIDatePicker, UIViewController, that will contain it, UIPopoverController with contentSize of UIDatePicker, and then handle events of UIDatePicker. Let's simplify that! With DTPickerPresenter here's what you need to do:

```objective-c
__weak typeof (self) weakSelf = self;
DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate) {
    //Process date
}];
self.popover = [UIPopoverController dt_popoverWithPresenter:presenter];
// present popover.
```
And so, with just two lines of code, we created date picking UIPopoverController.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/DenHeadless/dtpickerpresenter/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

