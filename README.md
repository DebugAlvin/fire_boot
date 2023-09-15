# Fire_Boot开发指南

## 命名规范

## 1.文件名

由小写英文加下划线组成；如 custom_app_bar.dart ， icon_user_image_default.jpg

## 2.类名

大驼峰法,如 CustomAppBar

## 3.函数名，变量名、参数名

小驼峰法；如 函数名: updateRenderObject() ; 变量名，参数名： userName ;

另外类的成员变量： 不使用 m前缀(如mUserName)，而是 userName

## 文件夹名(包名)

由小写英文或下划线组成；如文件夹名 home_page

## Widget开发规范

1. 将每个Widget的定义整理到单独的函数里，达到UI页面代码清晰
2. 将复杂的Widget进行封装
3. 封装单个Widget，方便复用
4. Widget build方法：在 build 方法里尽量用最少的代码实现整体视图
   可以把复杂的widget代码放到一个或多个方法中。
5. 控件间距使用SizeBox占位
6. 善用装饰器模式
7. 使用方法签名遵循高内聚(迪米特原则)的代码规范，具体可以看Listview itemBuilder源码、

<pre><code>
ListView.builder(
  itemBuilder:(BuildContext context, int index){
    return Text('hello');
  }
  ......
);
</code></pre>

8. Stack组件优先使用Positioned.fill作为孩子组件

<pre><code>
    Stack(
      children: [
        _buildBody(),
        Positioned.fill(child: Container(color: Colors.red,)),
        Positioned.fill(child: Container(color: Colors.black,)),
      ],
    );
</code></pre>

<pre><code>
    SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: Colors.red,)),
          Positioned.fill(child: Container(color: Colors.black,)),
        ],
      ),
    );
</code></pre>

9. Container嵌套Text，需要Text居中显示，需要设置height为1.2

<pre><code>
    Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      color: Colors.black,
      child: const Text('居中显示',style: TextStyle(color: Colors.white,fontSize: 15,height: 1.2),),
    );
</code></pre>

10. 图片使用AspectRatio嵌套
11. UI布局少用if else，尽量使用Stack嵌套Visibility

相关资料：

- [嵌套地狱官方解决方案](https://blog.csdn.net/m0_59449563/article/details/126531927)
- [喜马拉雅PC案例改善套娃地狱问题](https://blog.51cto.com/u_13689323/4940447)
- [为什么 Flutter钟爱 装饰器模式和组合模式](https://www.jianshu.com/p/5b630ae4d832)

## GetX开发规范

1. 尽可能使用obx(被动动状态管理)而不使用GetBuilder(主动状态管理)
2. 使用view（视图）、logic（控制器）、binding（依赖）的项目结构
3. 使用GetX代码生成工具生成模块选择easy模式，勾选addBinding、addLifecycle，
   另外，GetBuilder、Container等常用组建均可使用插件生成[插件使用指南](https://juejin.cn/post/7005003323753365517#heading-9)
4. 业务逻辑尽可能写到controller里面，page和view只是布局

<pre><code>
class TestHUDPage extends BaseView<TestHUDLogic> {
  TestHUDPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(
      appBarTitleText: '测试HUD',
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomSmallMainButton(
            title: '测试Loading',
            onTap: () => controller.onTestLoading(context),
          ),
        ),
        const SizedBox(height: AppValues.defaultPadding,),
        Center(
          child: CustomSmallMainButton(
            title: '测试Toast',
            onTap: () => controller.onToast(context),
          ),
        ),
      ],
    );
  }
}
</code></pre>

<pre><code>
class TestHUDLogic extends BaseController {
  Future<void> onTestLoading(BuildContext context) async {
    CustomProgressHUD.show(context,content: '正在加载...');
    Future.delayed(const Duration(seconds: 5),(){
      CustomProgressHUD.dismiss(context);
    });
  }

  Future<void> onToast(BuildContext context) async {
    CustomToast.show('测试Toast', context);
  }
}
</code></pre>

## 代码规范

+ if else使用大括号，尽可能不省略；

+ 不使用new来实例对象(dart 旧版本语法)；

+ page页面中（StatelessWidget、StatefulWidget）尽量将每一层和每一个widget以单独函数形式调用，层次清晰分明（工具类封装的Widget可例外）；

+ 封装简单常用的widget，注意使用@required、assert对参数进行限定，判断；

+ 常用的颜色值和宽高值，使用统一相同含义值来赋值；

+ 实时处理报错（error）和警告（warning）：Dart Analysis统计了所有报错和警告的具体信息；（好处：一则让代码程序更健壮，二则在dart
  sdk升级后，可避免报错）；

+ 必要的简要的代码注释（不止是.dart文件，还包括pubspec.yaml）;

+ 编码过程中习惯性使用“Reformat Code with dartfmt”;

+ 拒绝弱命名（如var a），拒绝硬编码（如if (a == 2)...）；

+ 善用///[]，"[]"内可以是类名、变量名，在引用中可以添加注释说明；

+ 适当的换行，函数体之间、语句过长等；

## 手架项目说明

## 1.项目结构

+ base（父类），通常是一些wiget的封装，如BaseView
+ constant（常量），通常是一些app的域名、第三方sdk的key、button或text的样式
+ model（模型）通常是json模型，可配合插件jsonToDart自动生成
+ pages(页面)通常是ui页面，可配合getx插件生成
+ services(业务逻辑层)，通常是一个单例，针对接口请求、数据缓存等业务逻辑进行封装
+ utils(工具类)通常是一些api或三方库的简单封装
+ widget（widget封装）一些常用控件
+ middleware（路由权鉴）拦截登录校验弹窗逻辑等

## 2.设置主题色

+ 在main.dart里面设置GetMaterialApp

<pre><code>
GetMaterialApp(
    theme: ThemeService.lightTheme,
    darkTheme: ThemeService.darkTheme,
    themeMode: ThemeService.instance.themeMode,
    ....
  )
</code></pre>

+ 根据UI设计图的设计规范在AppThemes.dart(颜色)、
  ThemeService.dart(文字、按钮、导航栏配置)设置常量

<pre><code>
   //AppThemes.dart
  ///general color name
  static const milkWhite = Color(0xFFFAFBFD);
  static const blueBayoux = Color(0xff38686A);
  static const bloodRed = Color(0xFFEE4A50);
  static Color greyWithOpacityHalf = Colors.grey.withOpacity(0.5);

  ///theme color
  ///Scaffold的默认颜色典型Material应用程序或应用程序内页面的背景颜色
  static const pageLightBackground = Color(0xFFFFFFFF);//浅色风格
  static const pageDarkBackground = Color(0xFF010101);//暗黑风格
</code></pre>
<pre><code>
   //ThemeService.dart

  //暗黑模式
  static final darkTheme = ThemeData.dark().copyWith(
    backgroundColor: AppThemes.pageDarkBackground,
    scaffoldBackgroundColor: AppThemes.pageDarkBackground,
    primaryColor:AppThemes.primaryColor,
    shadowColor:AppThemes.colorShadow,
    bottomAppBarColor:AppThemes.bottomAppBarColor,
    ......
  );

  //明亮模式
  static final lightTheme = ThemeData.light().copyWith(
    backgroundColor: AppThemes.pageLightBackground,
    scaffoldBackgroundColor: AppThemes.pageLightBackground,
    primaryColor:AppThemes.primaryColor,
    shadowColor:AppThemes.colorShadow,
    bottomAppBarColor:AppThemes.bottomAppBarColor,
    ......
  );
</code></pre>

+ 开发规范

 <p>
我们按照设计稿开发一般有三种情况：
 <p>
一.数值和设计规范一致，并且支持主题色切换。这种情况直接使用原生widget就可以了
<pre><code>
///根据ThemeService的配置如果centerTitle、
///backgroundColor不设置会得到一个默认的导航栏
///暗黑模式：背景使用透明色标题使用白色
///浅色模式：背景使用主题色标题使用白色
AppBar(
      leading: leading,
      // backgroundColor: Colors.white, //这里会覆盖默认的颜色
      elevation: 0,
      automaticallyImplyLeading: true,
       iconTheme: ThemeService().theme.appBarTheme.iconTheme,
      title: Text(
        '导航栏',
      ),
    );
</code></pre>
二.数值和设计规范一致，但是支持主题色切换
<pre><code>
///根据ThemeService的配置TabBar的配置如下

///暗黑模式：选中时title文字大小15文字颜色白色
///未选中时title文字大小15文字颜色灰色

///浅色模式：选中时title文字大小15文字颜色黑色
///未选中时title文字大小15文字颜色灰色

///我们现在设计稿上有个TabBar控件和默认的配置相比差异化
///文字大小是17而默认配置是15但其它配置不变，这种情况我们可以
///使用copyWith来解决问题
TabBar(
labelStyle:  ThemeService().theme.tabBarTheme.labelStyle?.copyWith(fontSize: 17),
unselectedLabelStyle:  ThemeService().theme.tabBarTheme.labelStyle?.copyWith(fontSize: 17),
......
);
</code></pre>

二.数值和设计规范不一致，但不支持主题色切换
<pre><code>
///能用常量就尽可能用常量，不要硬编码
Text(
  style:AppThemes.textPrimaryColorDark
  ......
);
</code></pre>

三.常规方案
<pre><code>
///字体使用CustomText
CustomText(
  'CustomText',
  style: ThemeService().theme.textTheme.labelSmall,
  textColorStyle: CustomTextColorStyle.panda,
);
</code></pre>

<pre><code>
///使用Text时使用CustomTextColorStyle.xxx.value设置颜色
    RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'RichText不一样的',
        style: ThemeService()
            .theme
            .textTheme
            .titleMedium
            ?.copyWith(color: CustomTextColorStyle.primary.value),
      ),
      TextSpan(
        text: '字体颜色',
        style: ThemeService()
            .theme
            .textTheme
            .bodyMedium
            ?.copyWith(color: CustomTextColorStyle.grey.value),
      ),
    ]));
</code></pre>
