## 利用超声波测距传感器通过手的远近控制灯的亮度

**基本上大家需要使用任何的硬件外设都可以参照下面的步骤找到Arduino上适用的函数库**

- 打开Arduino官网：http://www.arduino.cc/
- 点击网页最上方的Learning里的Playground：http://playground.arduino.cc/
- 找到页面左边的Interfacing with Hardware：http://playground.arduino.cc//Main/InterfacingWithHardware
- 页面向下找到Input里的Distance Sensing：http://playground.arduino.cc//Main/InterfacingWithHardware#DistanceSensing
- 在Distance Sensing栏目中找到SRF04传感器，打开其函数库的链接：http://code.google.com/p/srf04-library/
- 在Download页面下载源文件：https://code.google.com/p/srf04-library/downloads/list
- 将下载好的压缩包解压到Arduino程序安装位置里的libraries文件夹中
- 打开Arduino程序，点击：文件->示例->DistanceSRF04->Centimeter，打开函数库自带的例程
- 将SRF04超声波传感器的echo端连到Arduino板子上的端口2，trig端连到Arduino板子上的端口3
- 上传示例到Arduino板子上，然后打开串口监视器观察输出
- 每0.5秒会输出超声波测距传感器测得的距离
- 打开创意周末的程序，参考程序中的说明进行操作

