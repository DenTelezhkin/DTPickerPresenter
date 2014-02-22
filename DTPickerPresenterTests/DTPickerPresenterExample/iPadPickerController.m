//
//  iPadPickerController.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 16.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "iPadPickerController.h"
#import "DTPickerPresenter.h"

@interface iPadPickerController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray * tableItems;
@property (nonatomic, strong) UIPopoverController  * popover;
@end

@implementation iPadPickerController

static NSString * const iPadCell = @"iPadMenuCell";

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iPadCell];
    self.tableItems = @[@"Select date", @"Select from picker"];
}

-(NSInteger)numberOfSectionsInTableView :(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:iPadCell forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.tableItems[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof (self) weakSelf = self;
    switch (indexPath.row)
    {
        case 0:
        {
            DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate) {
                NSString * newDate = [selectedDate description];
                weakSelf.tableItems = @[newDate,weakSelf.tableItems[1]];
                [weakSelf.tableView reloadData];
            }];
            self.popover = [UIPopoverController dt_popoverWithPresenter:presenter];
            break;
        }
        case 1:
        {
            DTPickerDataSource * datasource = [DTPickerDataSource datasourceWithItems:@[@[@"foo", @"bar", @"cat"], @[@"OMG!", @"WTF!"]]];
            
            DTPickerChangeBlock block = ^(NSArray * selectedComponents, NSIndexPath * selectedIndexPath) {
                NSString * text = [selectedComponents.firstObject stringByAppendingFormat:@" - %@", selectedComponents.lastObject];
                weakSelf.tableItems = @[weakSelf.tableItems[0],text];
                [weakSelf.tableView reloadData];
            };
            DTPickerViewPresenter * wheelPresenter = [DTPickerViewPresenter presenterWithDatasource:datasource
                                                                                        changeBlock:block];
            self.popover = [UIPopoverController dt_popoverWithPresenter:wheelPresenter];
        }
            break;
        default:
            break;
    }
    [self.popover presentPopoverFromRect:[tableView cellForRowAtIndexPath:indexPath].frame
                                  inView:self.view
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
}

@end
