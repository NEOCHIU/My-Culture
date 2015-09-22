//
//  CultureCategoryViewController.m
//  MyCulture
//
//  Created by CosenMac on 2015/8/26.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "CultureCategoryViewController.h"
#import "CultureCategoryTableViewCell.h"
#import "CultureTypeViewController.h"

@interface CultureCategoryViewController ()
{
    
    UIActivityIndicatorView *myActivityView;
    UIView *myview;
}

@end

@implementation CultureCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catTable.delegate = self;
    self.catTable.dataSource = self;
//    
//  //加入myActivityView讀取畫面
     myview =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1004)];
    [myview setBackgroundColor:[UIColor blackColor]];
    [myview setAlpha:0.5];
    myActivityView = [[UIActivityIndicatorView alloc]
                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    myActivityView.color=[UIColor redColor];
    [myActivityView setFrame:CGRectMake(140, 250, 160,250)];
    myActivityView.center = self.view.center;
    myActivityView.hidesWhenStopped = YES;
    
    UILabel *mylabel = [[UILabel alloc] initWithFrame:CGRectMake(myActivityView.frame.origin.x+50,myActivityView.frame.origin.y+50, 160, 250)];
    mylabel.text = @"讀取中⋯";
    mylabel.backgroundColor = [UIColor clearColor];
    mylabel.font = [UIFont systemFontOfSize:22];
    mylabel.textColor = [UIColor whiteColor];
    [myview addSubview:mylabel];
    [myview addSubview:myActivityView];

//  //讀取url
 NSURL *url = [NSURL URLWithString:@"http://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindAllTypeJ"];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
 //取得Json資訊
 NSArray* jsonobj = [NSJSONSerialization JSONObjectWithData:data
                                                           options:NSJSONReadingMutableContainers
                                                             error:nil];
  //初始化Listobj物件
   _ListObj = [[NSMutableArray alloc]init];
        
   //迭代出NSArray裡面的所有值，轉成物件後，存放到NSMutableArray裡面
  [jsonobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
      NSDictionary* jsonArray = [jsonobj objectAtIndex:idx];
      NSLog(@"array1:%@",jsonArray);
      CatObject *product = [[CatObject alloc] initWithDictionary:jsonArray error:nil];
      [_ListObj addObject:product];
      
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
  
    
    static NSString *simpleTableIdentifier = @"CultureCategoryTableCell";
    CultureCategoryTableViewCell *cell = (CultureCategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CultureCategoryTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //取得NSMutableArray裡面的物件
    //接著就可以用物件屬性的方式來操作物件

    CatObject *catObject = [_ListObj objectAtIndex:[indexPath row]];
    
    //接著就可以用物件屬性的方式來操作物件
    cell.numLabel.text = catObject.categoryCode;
    cell.catNameLabel.text = catObject.categoryName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

   //開始圈圈與畫面
    [self.view addSubview:myview];
    [myActivityView startAnimating];
    
    //GCD呈現
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //將code 轉成參數值
        CatObject *catObject = [_ListObj objectAtIndex:[indexPath row]];
        
        CultureTypeViewController *typeView  = [[CultureTypeViewController alloc] initWithNibName:@"CultureTypeViewController" bundle:[NSBundle mainBundle]];
    
        dispatch_async(dispatch_get_main_queue(), ^{
         
            //傳遞參數
            typeView.catTypeCode = catObject.categoryCode;
            //切換畫面
            [self.navigationController pushViewController:typeView animated:YES];
            //結束圈圈與畫面
            [myview removeFromSuperview];
            [myActivityView stopAnimating];
   
        });
    });
    

    

    
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
