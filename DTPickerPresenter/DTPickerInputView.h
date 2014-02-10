//
//  DTPickerInputView.h
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DTPickerInputViewSelection <NSObject>

-(void)pickerViewDidCancel;
-(void)pickerViewDidFinishSelectionWithResult:(NSIndexPath *)selectedIndexPath;

@end

@interface DTPickerInputView : UIView

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, weak) id <DTPickerInputViewSelection> delegate;

@end
