//
//  PlayProgramViewController.m
//  podcast_simple
//
//  Created by mac15 on 2020/12/30.
//

#import "PlayProgramViewController.h"
@interface PlayProgramViewController ()
{
    AVAudioPlayer *player;
    NSTimer *timer;
    IBOutlet UILabel *CurrentTime;
    IBOutlet UILabel *totalTime;
    NSString *Playname;
    int number;
    int countrepeat;
}
@end

@implementation PlayProgramViewController
@synthesize PlayImage;
@synthesize PlaySlider;
@synthesize Playdetail;
@synthesize PlayProgram;
@synthesize StopProgram;
@synthesize backPlay;
@synthesize HandPlay;
@synthesize RepeatPlay;
@synthesize nowTime;
@synthesize TotalTime;
@synthesize navigationbaritem_play;

- (void)viewDidLoad {
    [super viewDidLoad];
    //設定音樂
    number = [_PlayNumber intValue];
    if([_Radio_name isEqualToString:@"壹加壹"]){
        Playname = [[NSString alloc]initWithFormat:@"oneplusone_ep%i", number];
    }else if([_Radio_name isEqualToString:@"Ted Talk"]){
        Playname = [[NSString alloc]initWithFormat:@"TedTalk_ep%i", number];
    }else if([_Radio_name isEqualToString:@"三不五時七步成詩"]){
        Playname = [[NSString alloc]initWithFormat:@"threetofive_ep%i", number];
    }else{
        Playname = [[NSString alloc]initWithFormat:@"frog_ep%i", number];
    }
    NSLog(@"%@", Playname);
    NSString *path = [[NSBundle mainBundle]pathForResource: Playname ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    PlaySlider.maximumValue = (int)player.duration;
    PlaySlider.value = 0;
    
    //設定傳過來的電台名稱和節目名稱
    Playdetail.text = _PlayList[number];
    [navigationbaritem_play setTitle: _Radio_name];
    //重複次數
    [player setNumberOfLoops: 0];
    //圖片設定
    NSString *image_number;
    image_number = [[NSString alloc] initWithFormat:@"%@.jpg", _Radio_name];
    PlayImage.image = [UIImage imageNamed: image_number];
    //音樂播放
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    [player play];
    //設定重複次數
    countrepeat = 0;
    //自動播放下一首
}
-(void)updateTime:(NSTimer *)timer{
    
    PlaySlider.value = (int)player.currentTime;
    
    //獲取音訊的總時間
    NSTimeInterval totalTimer = player.duration;
    //獲取音訊的當前時間
    NSTimeInterval currentTime = player.currentTime;
    
    NSTimeInterval currentM = currentTime/60;
    currentTime = (int)currentTime % 60;
    NSTimeInterval totalM = totalTimer/60;
    totalTimer = (int)totalTimer % 60;
    
    NSString *timecurrect = [NSString stringWithFormat:@"%02.0f:%02.0f",currentM, currentTime];
    NSString *timetotal = [NSString stringWithFormat:@"%02.0f:%02.0f", totalM,totalTimer];
    
    [nowTime setText: timecurrect];
    [TotalTime setText:timetotal];
}
- (IBAction)btnStop:(id)sender {
    [player pause];
}

- (IBAction)btnPlay:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    //PlaySlider.value = 0.0;
    [player play];
}
- (IBAction)SliderChange:(id)sender {
    [player pause];
    [player setCurrentTime: PlaySlider.value];
}

- (IBAction)btnRepeat:(id)sender {
    if(countrepeat == 0){
        RepeatPlay.tintColor = [UIColor redColor];
        [player setNumberOfLoops: -1];
        countrepeat++;
    }else{
        RepeatPlay.tintColor = [UIColor blueColor];
        [player setNumberOfLoops: 0];
        countrepeat--;
    }
}
- (void)audioplayerDidFinishItem:(AVAudioPlayer *)audioplayer{
    //循環節目
    if(number == (_PlayList.count - 1)){
        number = 0;
    }else{
        number++;
    }
    
    if([_Radio_name isEqualToString:@"壹加壹"]){
        Playname = [[NSString alloc]initWithFormat:@"oneplusone_ep%i", number];
    }else if([_Radio_name isEqualToString:@"Ted Talk"]){
        Playname = [[NSString alloc]initWithFormat:@"Ted Talk_ep%i", number];
    }else if([_Radio_name isEqualToString:@"三不五時七步成詩"]){
        Playname = [[NSString alloc]initWithFormat:@"threetofive_ep%i", number];
    }else{
        Playname = [[NSString alloc]initWithFormat:@"flog_ep%i", number];
    }
    NSString *path = [[NSBundle mainBundle]pathForResource:Playname ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    PlaySlider.maximumValue = (int)player.duration;
    PlaySlider.value = 0;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    [player play];
    Playdetail.text = _PlayList[number];
}
- (IBAction)btnBack:(id)sender {
    //循環節目
    if(number == 0){
        number = (_PlayList.count - 1);
    }else{
        number--;
    }
    
    if([_Radio_name isEqualToString:@"壹加壹"]){
        Playname = [[NSString alloc]initWithFormat:@"oneplusone_ep%i", number];
    }else if([_Radio_name isEqualToString:@"Ted Talk"]){
        Playname = [[NSString alloc]initWithFormat:@"Ted Talk_ep%i", number];
    }else if([_Radio_name isEqualToString:@"三不五時七步成詩"]){
        Playname = [[NSString alloc]initWithFormat:@"threetofive_ep%i", number];
    }else{
        Playname = [[NSString alloc]initWithFormat:@"flog_ep%i", number];
    }
    NSString *path = [[NSBundle mainBundle]pathForResource:Playname ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    PlaySlider.maximumValue = (int)player.duration;
    PlaySlider.value = 0;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    [player play];
    Playdetail.text = _PlayList[number];
}

- (IBAction)btnNext:(id)sender {
    //循環節目
    if(number == (_PlayList.count - 1)){
        number = 0;
    }else{
        number++;
    }
    
    if([_Radio_name isEqualToString:@"壹加壹"]){
        Playname = [[NSString alloc]initWithFormat:@"oneplusone_ep%i", number];
    }else if([_Radio_name isEqualToString:@"Ted Talk"]){
        Playname = [[NSString alloc]initWithFormat:@"Ted Talk_ep%i", number];
    }else if([_Radio_name isEqualToString:@"三不五時七步成詩"]){
        Playname = [[NSString alloc]initWithFormat:@"threetofive_ep%i", number];
    }else{
        Playname = [[NSString alloc]initWithFormat:@"flog_ep%i", number];
    }
    
    NSString *path = [[NSBundle mainBundle]pathForResource:Playname ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    PlaySlider.maximumValue = (int)player.duration;
    PlaySlider.value = 0;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    [player play];
    Playdetail.text = _PlayList[number];
}
@end
