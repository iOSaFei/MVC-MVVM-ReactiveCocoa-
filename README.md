# MVC-MVVM-ReactiveCocoa-
#MVC、MVVM、RaectiveCocoa的总结
本文所有Demo地址：https://github.com/iOSaFei/MVC-MVVM-ReactiveCocoa-
###真的理解MVC吗？

从刚开始做iOS项目的时候，就知道要使用MVC，虽然不懂为什么但总是会建三个文件夹。写的东西多了见的东西多了才发现还欠MVC一次总结。

为了有权威性先摆上斯坦福大学公开课上的一幅图：


----------
![Alt text](./F482D2FF-29BD-4B9D-9AD7-C8B8EADCD133.gif)

这幅图需要注意以下几点：
Model：数据模型，**负责数据的获取及存放**，数据的获取可能是网络请求也可能是本地数据库访问，存放是指数据解析之后放在Model中方便Controller提供给View使用。

View：视图，负责UI的展示，它是需要数据的。

Controller：控制器，协调数据和视图（将Model中的数据提供给视图）。

Controller持有Model和View，Model和View之间不应该持有、也就是Model不能直接和View通信，这体现出了MVC数据模块与视图模块的分离。提高了程序的可维护性、可移植性、可扩展性与可重用性。

Model和Controller之间采用KVO和Notification通信，为什么不用Block和代理？从技术上是可以的，但是在MVC中，Model不需要知道被Controller持有，KVO和Notification在解耦和方面比Block要好，但是Block很方便，使用全凭个人爱好。

Controller和View采用委托（代理和数据源）或target-action，前者的典型UITableView，后者诸如UIButton等。

知道了这些就可以用MVC写东西了，但是似乎Model这块怎么写还是不是那么的清楚？而且很容易写成Massive View Controller 模式。就比如在Controller中直接使用AFNetwrking请求、然后将请求的数据在Controller中解析成Model，这是最不推荐的一种写法，AFNetworking如果不维护了呢？这样写Controller里代码增加了多少？这里我给出一种MVC的Demo供大家借鉴，这里我将每个网络请求都封装成了一个类。另外给出一个我看到并受益的观点：
1、将 UITableView 的 Data Source 分离到另外一个类中。
2、将数据获取和转换的逻辑分别到另外一个类中。
3、将拼装控件的逻辑，分离到另外一个类中。

###MVVM的出现
MVVM是MVC发展的产物，从命名中可以看出这种模式减少了Controller的职责。

在这种模式下：
Model的职责依然是获取数据，但不会去负责给View提供数据了。
View-Model负责将Model获取的数据解析成View所需要的数据模型。
而此时Controller则不再需要负责Model转换的逻辑了（事实上、上面MVC的demo中我就已经优化了这一点、因为MVC并没有指出数据解析应该放在哪里）。
view的任务就是呈现由view-model提供的数据。

如果只有以上这些不同，你可能会觉得这跟MVC根本没什么差异。MVVM 在使用过程中，通常还会利用双向绑定技术：Model 变化时，ViewModel 会跟着自动改变，而 ViewModel 变化也会引起 View 自动变化。
iOS 中，可以使用 KVO 或 Notification 实现。而且，GitHub 开源的 ReactiveCocoa 可以很优美的实现这种绑定。当然ReactiveCocoa还可以用在很多地方。
我会给出两个Demo，一个是使用KVO实现的MVVM，另一个使用RAC实现的MVVM。

这些Demo都很清晰明了，这里就不贴代码了，去Github上下载的时候记得点个赞哦！
这些Demo很能说明问题，但毕竟不是一个整体的项目、没有展示RAC如何使用，我过段时间会使用MVVM+RAC重写我以前上线的一个项目：玩转西邮，到时候也会放到Github上。

###简单介绍一下RAC

ReactiveCocoa（简称为RAC）,是由Github开源的一个应用于iOS和Mac OS开发的新框架。

ReactiveCocoa作用：
我们在iOS开发过程中，代理、KVO、点击事件等都可以通过RAC处理。
从上面MVVM+KVO的Demo中可以看出RAC非常符合高聚合，低耦合的思想。

ReactiveCocoa的思想：
ReactiveCocoa结合了函数式编程思想和响应式编程思想，所以ReactiveCocoa被描述为函数响应式编程（FRP）框架。

函数式编程思想：是把操作尽量写成一系列嵌套的函数或者方法调用。
响应式编程思想：如果 a ＝ b ＋ c ； b 或者 c 的值变化后，a 的数值会同时发生变化。
关于这两个思想我也写了Demo可以一并下载，关于思想的Demo参考自：http://www.jianshu.com/p/87ef6720a096中的代码（指明出处是最起码的尊重）。

本文所有Demo地址：https://github.com/iOSaFei/MVC-MVVM-ReactiveCocoa-

把复杂留给自己，把简洁留给他人。
