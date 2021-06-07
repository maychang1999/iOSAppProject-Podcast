//
//  ViewController.m
//  podcast_simple
//
//  Created by mac15 on 2020/12/22.
//

#import "ViewController.h"
#import "ProgramViewController.h"
#import "FMDB.h"

@interface ViewController ()
{
    NSInteger selectIndex;
    
    NSString *index1;
    int count;
    
    FMDatabase *db;
    NSMutableArray *dataradio;
    NSMutableArray *datashow;
    UIColor *purpleColor;
    UIColor *greyblueColor;
    UIColor *yellowColor;
    UIColor *greenColor;	
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    dataradio = [[NSMutableArray alloc] init];
    datashow = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    [self dbdrop];
    [self dbcreate];
    [self dbinsert];
    [self dbquery];
    
    
}

-(void) dbdrop{
    
    [db executeUpdate:@"DROP TABLE radio;"];
    [db executeUpdate:@"DROP TABLE show;"];
}

- (void) dbcreate {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *pathName = [doc stringByAppendingPathComponent:@"podcastdb.sqlite"];
    db = [FMDatabase databaseWithPath:pathName];
    
    [db open];
    [self dbdrop];
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS radio (radioID INTEGER PRIMARY KEY, radioName TEXT NOT NULL, description TEXT, radioPic TEXT NOT NULL);"];
    
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS show (showID INTEGER PRIMARY KEY, radioNum INTEGER, showTitle TEXT NOT NULL, showFile TEXT NOT NULL);"];
    
}

-(void) dbinsert {
    [db executeUpdate:@"INSERT INTO radio(radioID, radioName, description, radioPic) VALUES (?, ?, ?, ?)", @(1), @"壹加壹", @"很愛互嗆交往八年的資深情侶，可以從小熊餅乾聊到太陽系，無笑免錢！", @"oneplusone.jpg"];
    
    [db executeUpdate:@"INSERT INTO radio(radioID, radioName, description, radioPic) VALUES (?, ?, ?, ?)", @(2), @"Ted Talk", @"Every weekday, TED Talks Daily brings you the latest talks in radio.", @"tedtalk.jpg"];
    
    [db executeUpdate:@"INSERT INTO radio(radioID, radioName, description, radioPic) VALUES (?, ?, ?, ?)", @(3), @"三不五時七步成詩", @"音樂人podcast不聊音樂講幹話，但把幹話podcast當音樂製作算不算音樂類podcast?", @"threeseven.jpg"];
    
    [db executeUpdate:@"INSERT INTO radio(radioID, radioName, description, radioPic) VALUES (?, ?, ?, ?)", @(4), @"呱吉", @"上班不要看的呱吉aka台北市議員邱威傑", @"frog.jpg"];
    
    /*----------------------------------------------------*/
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(1), @(1), @"EP.01 在Uniqlo打工的奴性要夠強", @"oneplusone_ep01.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(2), @(1), @"EP.02 Facebook現在都是老人在用的啦", @"oneplusone_ep02.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(3), @(1), @"EP.03 曖昧的時候是先問再做還是先做再說？ 2020年小事大回顧", @"oneplusone_ep03.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(4), @(1), @"EP.04 空中吵架教室，這集播完應該不會有手遊廠商找我們了", @"oneplusone_ep04.mp3"];
     
     [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(5), @(1), @"EP.05 你今天撒嬌了嗎？三倍卷怎麼用比較好阿？", @"oneplusone_ep05.mp3"];
    
    /*----------------------------------------------------*/
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(6), @(2), @"EP.01 An innovative way to support children with special needs | Billy Samuel Mwape", @"tedtalk_ep01.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(7), @(2), @"EP.02 What your sleep patterns say about your relationship | TEDx SHORTS", @"tedtalk_ep02.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(8), @(2), @"EP.03 WWhy lakes and rivers should have the same rights as humans | Kelsey Leonard", @"tedtalk_ep03.mp3"];
    
    /*----------------------------------------------------*/
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(9), @(3), @"EP.01 AKA取得好，前輩也彎腰，從頂埔到印度走跳拒當汗勞化身韓老", @"threeseven_ep01.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(10), @(3), @"EP.02 沒入圍金曲 指鹿為哭馬 路怒症vs黑賓士甩棍", @"threeseven_ep02.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(11), @(3), @"EP.03 哭馬獎最哭電影片單 政治不正確之JK羅琳vs大衛夏普爾", @"threeseven_ep03.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(12), @(3), @"EP.04 FB動態大亂鬥之一起去文青蟑螂屋喝鮮奶苦茶ㄇ", @"threeseven_ep04.mp3"];
    
    /*----------------------------------------------------*/
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(13), @(4), @"【呱吉直播】 EP.01 人生晚長，跟童年說再見", @"frog_ep01mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(14), @(4), @"【呱吉直播】 EP.02 人生晚長EP99：我與我真實的90年代（和我的90朋友）", @"frog_ep02.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(15), @(4), @"【呱吉直播】 EP.03 當個獨立的人", @"frog_ep03.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(16), @(4), @"【呱吉直播】 EP.04 大港我輸了", @"frog_ep04.mp3"];
    
    [db executeUpdate:@"INSERT INTO show(showID, radioNum, showTitle, showFile) VALUES (?, ?, ?, ?)", @(17), @(4), @"【呱吉直播】 EP.05 原來愛情都是鬼遮眼 謝謝朱榜眼", @"frog_ep05.mp3"];
    
}

-(void) dbquery{
    
    FMResultSet *resultRadioSet = [db executeQuery:@"select distinct radioName from radio;"];
    
    while ([resultRadioSet next]){
        NSString *radioName = [resultRadioSet stringForColumn:@"radioName"];
        //NSInteger *radioID = [resultRadioSet intForColumn:@"radioID"];
        NSLog(@"%@", radioName);
        [dataradio addObject:radioName];
    }
}

-(void) dbquery0{
    [datashow removeAllObjects];
    FMResultSet *resultShowSet = [db executeQuery:@"select distinct showTitle from show where radioNum = 1;"];

    while ([resultShowSet next]){
        NSString *showTitle = [resultShowSet stringForColumn:@"showTitle"];
        //NSInteger *showID = [resultRadioSet intForColumn:@"showID"];
        NSLog(@"%@", showTitle);
        [datashow addObject:showTitle];
    }
}

-(void) dbquery1{
    [datashow removeAllObjects];
    FMResultSet *resultShowSet = [db executeQuery:@"select distinct showTitle from show where radioNum = 2"];

    while ([resultShowSet next]){
        NSString *showTitle = [resultShowSet stringForColumn:@"showTitle"];
        //NSInteger *showID = [resultRadioSet intForColumn:@"showID"];
        NSLog(@"%@", showTitle);
        [datashow addObject:showTitle];
    }
}

-(void) dbquery2{
    [datashow removeAllObjects];
    FMResultSet *resultShowSet = [db executeQuery:@"select distinct showTitle from show where radioNum = 3"];

    while ([resultShowSet next]){
        NSString *showTitle = [resultShowSet stringForColumn:@"showTitle"];
        //NSInteger *showID = [resultRadioSet intForColumn:@"showID"];
        NSLog(@"%@", showTitle);
        [datashow addObject:showTitle];
    }
}

-(void) dbquery3{
    [datashow removeAllObjects];
    FMResultSet *resultShowSet = [db executeQuery:@"select distinct showTitle from show where radioNum = 4"];

    while ([resultShowSet next]){
        NSString *showTitle = [resultShowSet stringForColumn:@"showTitle"];
        //NSInteger *showID = [resultRadioSet intForColumn:@"showID"];
        NSLog(@"%@", showTitle);
        [datashow addObject:showTitle];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataradio count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    purpleColor = [UIColor colorWithHue:228.3/330.0 saturation: 0.6 brightness: 0.765 alpha: 0.25 ];
    
    greyblueColor = [UIColor colorWithHue:214.7/360.0 saturation: 0.29 brightness: 0.696 alpha: 0.4 ];
    
    //yellowColor = [UIColor colorWithHue:344.4/380.0 saturation: 1.0 brightness: 0.918 alpha: 0.05 ];
    
    greenColor = [UIColor colorWithHue:74.3/330.0 saturation: 1.0 brightness: 0.918 alpha: 0.25 ];
    
    yellowColor = [UIColor colorWithHue:60/330.0 saturation: 1.0 brightness: 0.988 alpha: 0.25 ];
    
    static NSString *cellidentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    NSString *string = [dataradio objectAtIndex:indexPath.row];
    cell.textLabel.text = string;
    if(indexPath.row % 2)
    {
        cell.contentView.backgroundColor = [UIColor clearColor];
        
    }else{
        cell.contentView.backgroundColor = yellowColor;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectIndex = indexPath.row;
    NSLog(@"db ok", @"Row Selected = %i",indexPath.row);
    count++;
    switch (selectIndex) {
        case 0:
            [self dbquery0];
            break;
        case 1:
            [self dbquery1];
            break;
        case 2:
            [self dbquery2];
            break;
        default:
            [self dbquery3];
            break;
    }
    [self performSegueWithIdentifier:@"ProgramSegue" sender:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[ProgramViewController class]])
    {
        if(count == 0){
        }else{
            ProgramViewController *program = (ProgramViewController *)segue.destinationViewController;
            index1 = [NSString stringWithFormat: @"%ld", (long)selectIndex];
            [program setValue: dataradio[selectIndex] forKey:@"Radio_name"];
            [program setValue: datashow forKey:@"ProgramData"];
            [program setValue: index1 forKey: @"RadioNumber"];
            NSLog(@"%@",dataradio[selectIndex]);
            count--;
        }
        
        NSLog(@"gotoProgram");
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

/*
-(void) searchTableList {
    NSString *searchString = radioSearch.text;
     
}*/

@end
