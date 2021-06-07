//
//  PlayProgramViewController.h
//  podcast_simple
//
//  Created by mac15 on 2020/12/30.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface PlayProgramViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *PlayImage;
@property (strong, nonatomic) IBOutlet UISlider *PlaySlider;
@property (strong, nonatomic) IBOutlet UILabel *nowTime;
@property (strong, nonatomic) IBOutlet UILabel *TotalTime;
@property (strong, nonatomic) IBOutlet UIButton *backPlay;
@property (strong, nonatomic) IBOutlet UIButton *HandPlay;
@property (strong, nonatomic) IBOutlet UIButton *PlayProgram;
@property (strong, nonatomic) IBOutlet UIButton *StopProgram;
@property (strong, nonatomic) IBOutlet UIButton *RepeatPlay;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationbaritem_play;
@property (strong, nonatomic) NSString *PlayProgram_name;
@property (strong, nonatomic) NSString *Radio_name;
@property (strong, nonatomic) NSMutableArray *PlayList;
@property (strong, nonatomic) NSString *PlayNumber;
- (IBAction)btnPlay:(id)sender;
- (IBAction)btnStop:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnRepeat:(id)sender;
- (IBAction)SliderChange:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Playdetail;



@end

NS_ASSUME_NONNULL_END
