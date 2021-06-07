//
//  ProgramViewController.m
//  podcast_simple
//
//  Created by mac15 on 2020/12/29.
//

#import "ProgramViewController.h"
#import "PlayProgramViewController.h"
@interface ProgramViewController ()
{
    NSInteger selectIndex;
    NSString *index1;
    int counter;
    
    UIColor *greyblueColor;
    UIColor *purpleColor;
    UIColor *yellowColor;
    UIColor *greenColor;
}
@end

@implementation ProgramViewController
@synthesize navigation_bar;
@synthesize ProgramData;
@synthesize radioImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Programtableview.delegate = self;
    Programtableview.dataSource = self;
    [navigation_bar setTitle:_Radio_name];
    [navigation_bar.leftBarButtonItem setTitle: @"Back"];
    counter = 0;
    
    //圖片設定
    NSString *image_number;
    image_number = [[NSString alloc] initWithFormat:@"%@.jpg", _Radio_name];
    radioImage.image = [UIImage imageNamed: image_number];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [ProgramData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    greyblueColor = [UIColor colorWithHue:214.7/360.0 saturation: 0.29 brightness: 0.696 alpha: 0.25 ];
    
    purpleColor = [UIColor colorWithHue:228.3/330.0 saturation: 0.6 brightness: 0.765 alpha: 0.15 ];
    
    greenColor = [UIColor colorWithHue:74.3/330.0 saturation: 1.0 brightness: 0.918 alpha: 0.25 ];
    
    yellowColor = [UIColor colorWithHue:60/330.0 saturation: 1.0 brightness: 0.988 alpha: 0.25 ];
    
    static NSString *cellidentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    NSString *string = [ProgramData objectAtIndex:indexPath.row];
    cell.textLabel.text = string;
    if(indexPath.row % 2)
    {
        cell.contentView.backgroundColor = greenColor;
        
    }else{
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectIndex = indexPath.row;
    NSLog(@"Row Selected = %i",indexPath.row);
    counter++;
    [self performSegueWithIdentifier:@"PlaySegue" sender:self.view];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[PlayProgramViewController class]])
    {
        if(counter == 0){
        }else{
            PlayProgramViewController *playprogram = (PlayProgramViewController *)segue.destinationViewController;
            index1 = [NSString stringWithFormat: @"%ld", (long)selectIndex];
            [playprogram setValue: ProgramData[selectIndex] forKey:@"PlayProgram_name"];
            [playprogram setValue: _Radio_name forKey:@"Radio_name"];
            [playprogram setValue: ProgramData forKey: @"PlayList"];
            [playprogram setValue: index1 forKey: @"PlayNumber"];
            counter--;
            NSLog(@"%@",ProgramData[selectIndex]);
            NSLog(@"gotoPlay");
        }
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
