//
//  ViewController.m
//  Techmarter_iWeather
//
//  Created by Trúc Phương >_< on 06/07/2017.
//  Copyright © 2017 NGBAO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature; // nhiet do
@property (weak, nonatomic) IBOutlet UIImageView *weatherICON;
@property (weak, nonatomic) IBOutlet UILabel *stt;
@property (weak, nonatomic) IBOutlet UILabel *CorF;

@end

@implementation ViewController { // khai bao instant variable
    NSArray* stts;
    NSArray* locations;
    NSArray* photoFiles;
    float Celsius ;
    NSString * string;
    bool isCelsius;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    stts = @[@"Khi bạn có thể dùng thể diện của mình để kiếm tiền, điều đó cho thấy bạn đã là một nhân vật tầm cỡ.",@"Có quyết tâm, vạch rõ mục tiêu, tất cả đều không còn là vấn đề, không còn là trở ngại.",@"Khi làm bất cứ việc gì, điều quan trọng không phải là những vật ngoài thân đã được chuẩn bị kỹ lưỡng hay chưa mà là ta đã đủ quyết tâm hay chưa?", @"Nếu bạn quan sát 1 lượt, 2 lượt rồi 3 lượt nhưng vẫn chưa hiểu, vậy hãy quan sát thêm vài lượt nữa, tôi tin rằng bạn nhất định sẽ có thu hoạch về cho bản thân!"]; // khai bao kieu mang
    locations= @[@"Hanoi, Vietnam",@"Danang, Vietnam",@"Newyork, USA",@"Saigon, Vietnam"];
    photoFiles= @[@"rain",@"windy",@"sunny",@"snow"];
    
    
}
- (IBAction)upDate:(id)sender { // touch up inside nhan xong tha ra
    int sttIndex = arc4random_uniform(stts.count);
//    NSLog(@"%d",sttIndex);
    self.stt.text = stts[sttIndex];
    
    int locIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locIndex];
    
    int imgIndex = arc4random_uniform(photoFiles.count);
    self.weatherICON.image = [UIImage imageNamed:photoFiles[imgIndex]];
    Celsius = [self gettemperature];
    string = [NSString stringWithFormat:@"%2.1f",Celsius];
    [self.temperature setTitle:(string) forState:(UIControlStateNormal)];
    NSLog(@"------bam up %2.1f",Celsius);
    isCelsius = true;
    
    
}
// instant method cho tung doi tuong cu the  co vidu trong img project

-(float) gettemperature{
    return 14.0 + (float)arc4random_uniform(20)+(float)arc4random()/(float)INT32_MAX;
}

// bai tap  doi C -> F
- (IBAction)getchange:(id)sender {
    NSLog(@"------bam change do F %2.1f",Celsius);
    if(isCelsius == true){
    string = [NSString stringWithFormat:@"%2.1f",Celsius*1.8+32.0];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    self.CorF.text = @"F";
        isCelsius = false;
    }else{
        NSLog(@"------bam change do C %2.1f",Celsius);
        string = [NSString stringWithFormat:@"%2.1f",Celsius];
        [self.temperature setTitle:string forState:UIControlStateNormal];
        self.CorF.text = @"C";
        isCelsius = true;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//Có dấu trừ trước khai báo là instant method
//Có dấu + trước khai báo là class method - goi thang tu class ra dung

//(float) casting: chuyển, ép sang kiểu float
// trong objective c -(kieutrave) namemethod
