import 'package:flutter/material.dart';
//4.3 线性布局（Row和Column）
/**
 * 所谓线性布局，即指沿水平或垂直方向排列子组件。Flutter 中通过Row和Column来实现线性布局，
 * 类似于Android 中的LinearLayout控件。Row和Column都继承自Flex，我们将在弹性布局一节中详细介绍Flex。
 *
 * 主轴和纵轴
 * 对于线性布局，有主轴和纵轴之分，如果布局是沿水平方向，那么主轴就是指水平方向，而纵轴即垂直方向；
 * 如果布局沿垂直方向，那么主轴就是指垂直方向，而纵轴就是水平方向。
 * 在线性布局中，有两个定义对齐方式的枚举类MainAxisAlignment和CrossAxisAlignment，分别代表主轴对齐和纵轴对齐。
 *
 * */

void main() {
  runApp(const MyApp());
}

/*
* Column
* Column可以在垂直方向排列其子组件。
* 参数和Row一样，不同的是布局方向为垂直，主轴纵轴正好相反
*
* */
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '线性布局（Row和Column）'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber, //导航栏背景色
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Row( //1
              mainAxisAlignment: MainAxisAlignment.center, //第一个Row很简单，默认为居中对齐
              children: [
                Text(" hello world "),
                Text(" I am ZA "),
              ],
            ),
            Row( //2
              /**
               * 第二个Row，由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示；
               * */
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("王者荣耀拿五杀"),
                Text("奇奇怪怪的人"),
              ],
            ),
            Row( //3
              /**
               * 第三个Row设置textDirection值为TextDirection.rtl，所以子组件会从右向左的顺序排列，
               * 而此时MainAxisAlignment.end表示左对齐，所以最终显示结果就是图中第三行的样子；
               * */
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.ltr,
              children: [
                Text(" 努力就有收获 "),
                Text(" 人人都能成功 "),
              ],
            ),
            Row(
              /**
               * 第四个 Row 测试的是纵轴的对齐方式，由于两个子 Text 字体不一样，所以其高度也不同，我们指定了verticalDirection值为VerticalDirection.up
               * 即从低向顶排列，而此时crossAxisAlignment值为CrossAxisAlignment.start表示底对齐。
               * */
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                Text(" I am zhangsan "),
              ],
            ),
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}









