//
//  ViewController_RadioList.h
//  podcast_simple
//
//  Created by mac15 on 2020/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_RadioList : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *Programtableview2;
    IBOutlet UINavigationItem *navigation_bar2;
    NSMutableArray *dynamic_array;
    NSMutableArray *DATA;
}
@end

NS_ASSUME_NONNULL_END
