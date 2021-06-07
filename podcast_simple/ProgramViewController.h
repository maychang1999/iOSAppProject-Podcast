//
//  ProgramViewController.h
//  podcast_simple
//
//  Created by mac15 on 2020/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgramViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *Programtableview;
}
@property (strong, nonatomic) NSString *Radio_name;
@property (strong, nonatomic) NSMutableArray *ProgramData;
@property (strong, nonatomic) NSString *RadioNumber;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigation_bar;
@property (weak, nonatomic) IBOutlet UIImageView *radioImage;

@end

NS_ASSUME_NONNULL_END
