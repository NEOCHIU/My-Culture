//
//  CultureTypeViewController.m
//  MyCulture
//
//  Created by kid chiu on 2015/8/29.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "AppDelegate.h"
#import "CultureTypeViewController.h"
#import "CultureTypeCell.h"
#import "CultureCategoryViewController.h"
#import "CultureDetailViewController.h"

@interface CultureTypeViewController ()

@end

@implementation CultureTypeViewController
@synthesize catTypeCode;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    NSLog(@"catTypeCode=%@",catTypeCode);
    
   
    
    NSString *urlString=[NSString stringWithFormat: @"http://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=%@&keyword=2015",catTypeCode];
    NSLog(@"urlString-%@",urlString);
    
    NSURL *url =[NSURL URLWithString:urlString];
    
   // NSURL *url = [NSURL URLWithString:@"hhttp://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=%@&keyword=2015"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    //取得Json資訊
    NSArray* jsonobj = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingMutableContainers
                                                         error:nil];
    //初始化Listobj物件
    _ListObj = [[NSMutableArray alloc]init];
   // _ListInfoObj = [[NSMutableArray alloc]init];
    //迭代出NSArray裡面的所有值，轉成物件後，存放到NSMutableArray裡面
    [jsonobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        NSDictionary* jsonArray = [jsonobj objectAtIndex:idx];
        NSLog(@"array1:%@",jsonArray);
        CatTypeObject *product = [[CatTypeObject alloc] initWithDictionary:jsonArray error:nil];
       // CatTypeInfoObject *product1 = [[CatTypeInfoObject alloc] initWithDictionary:jsonArray error:nil];;
        [_ListObj addObject:product];
        //[_ListInfoObj addObject:product1];

    }];

    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _ListObj.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CultureTypeCell";
    
    CultureTypeCell *cell = (CultureTypeCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CultureTypeCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //取得NSMutableArray裡面的物件
    //接著就可以用物件屬性的方式來操作物件
    CatTypeObject *catObject = [_ListObj objectAtIndex:[indexPath row]];
   // CatTypeInfoObject *catObject1 = [_ListInfoObj objectAtIndex:[indexPath row]];
//    NSLog(@"catObject1=%@",catObject.showInfo);
    //接著就可以用物件屬性的方式來操作物件
    cell.title.text = catObject.title;
    cell.startTime.text = catObject.startDate;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    CatObject *catObject = [_ListObj objectAtIndex:[indexPath row]];
    
     AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];
     NSLog(@"_ListObj[indexPath.row] = %@",_ListObj[indexPath.row]);
     ad.detailedData = _ListObj[indexPath.row];
    
    CultureDetailViewController *detail = [[CultureDetailViewController alloc] initWithNibName:@"CultureDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
