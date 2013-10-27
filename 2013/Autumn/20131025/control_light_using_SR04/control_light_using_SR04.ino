//使用DistanceSRF04库
#include <DistanceSRF04.h>

/*
	注意本例子中超声波传感器的连接：
	echo针脚连Arduino的端口2
	trig针脚连Arduino的端口3

	在Arduino的端口11连接一个LED灯

 */

DistanceSRF04 Dist;
int distance;

void setup()
{
  Serial.begin(9600);

  //下面这个begin函数设置了
  //echo针脚连到Arduino的端口2
  //trig针脚连到Arduino的端口3
  Dist.begin(2,3);
}

void loop()
{
  distance = Dist.getDistanceCentimeter();
  Serial.print("\nDistance in centimers: ");
  Serial.print(distance);

  //经过测试用手做障碍物
  //通常的测量范围在5~40厘米之间
  //因此用手遮挡时distance的值也在5~40之间
  //将distance的值乘以5
  //使其值的范围扩到到250
  int lightValue = distance*5;

  //将lightValue作为LED的亮度值输出
  //analogWrite函数中第二个输入参数
  //接受0~255之间的数
  analogWrite(11, lightValue);
}
