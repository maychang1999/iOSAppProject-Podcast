//
//  ViewController.h
//  podcast_simple
//
//  Created by mac15 on 2020/12/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *Radiotableview;
    NSMutableArray *Radio_Name;
    NSMutableArray *Data;
    IBOutlet UISearchBar *radioSearch;
    __weak IBOutlet UIImageView *logoImage;
}
@end

