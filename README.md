# WeChatExporter

* forked from tsycnh/WeChatExporter

2021-03-06 本地build成功，支持提取微信聊天记录，展示聊天记录

iphone导出微信聊天记录，备份微信聊天记录，mac系统

```
system info: 
ProductName:	Mac OS X
ProductVersion:	10.15.7
BuildVersion:	19H2

node version: v10.24.0

nwjs info: 0.40.2
sqlite3 binding: node-webkit-v0.40.2-darwin-x64
```


使用方法：
### 一、准备工作
Step1:数据导出：
首先需要将微信聊天数据进行导出。目前只支持iOS系统，如果你用的是安卓机，可以尝试将聊天记录迁移到iPad上，再导出。

按照下图使用iTunes备份整机数据，注意**不要选择**给iPhone备份加密

![image](https://github.com/tsycnh/WeChatExporter/blob/master/imgs/for%20readme/backup1.png)

使用第三方软件导出微信备份数据，这里使用的是iMazing。导出Documents文件夹即可。

![image](https://github.com/tsycnh/WeChatExporter/blob/master/imgs/for%20readme/backup2.png)

Step2:安装nodejs 下载地址：https://nodejs.org

Step3:安装nwjs 下载地址：https://dl.nwjs.io

### 二、运行软件

Step1: 下载项目 `git clone https://github.com/tsycnh/WeChatExporter`

Step2: `cd path/to/WeChatExporter`

Step3: `cd development`

Step4: `npm install`

Step5: 编译sqlite3.

1. 安装Xcode（AppStore 直接安装）
2. `sudo npm install -g node-gyp`
3. 补充 _by ishenyi_，需要安装 `npm install -g nw-gyp`;
3  `npm install sqlite3 --build-from-source --runtime=node-webkit --target_arch=x64 --target=0.40.1 --python=/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7 --registry=https://registry.npm.taobao.org`

注意事项：
* 【必须】target_arch参数为ia32或x64 ，分别对应32位或64位的nwjs
* 【必须】target参数为你所用的nwjs版本
* 【可选】Python为自定义的路径，必须为2.7版本。默认可不指定此参数。
* 【可选】Registry为国内镜像节点，下载不顺可尝试添加此参数 

5. 编译完成后会在如下目录出现已编译好的文件。
`Path/to/WeChatExporter/development/node_modules/sqlite3/lib/binding/node-webkit-v0.40.1-darwin-x64/node_sqlite3.node`
用的nwjs版本不同，生成的文件也不一样。

Step6: `/path/to/nw/nwjs.app/Contents/MacOS/nwjs .` 这里`.`指的路径工程development路径

即可运行导出工具。

### 三、使用软件

工具由两部分组成：(作者写了4各功能，我全部打开了，见index.html)

1.解析并导出数据

2.直接查看聊天内容

--------------

Step1: 点击开始原始数据分析按钮，然进入分析模式

Step2: 左上角显示的是在当前手机上登陆过的微信帐号，点击任意一个将在左下角显示和你聊过天的朋友，默认只显示聊天消息总数超过100的朋友（或群聊）。

Step3:点击左下角任意一聊天对象，会在右侧显示10条最近的聊天记录，以做确认之用。

Step4:这时右上角会显示某某与某某的聊天记录红色字符，点击下一步。

![image](https://github.com/tsycnh/WeChatExporter/blob/master/imgs/for%20readme/soft1.png)

Step5:填写数据导出目录，日期区间可以控制导出聊天记录的时间范围，默认不填表示全部导出。然后点击开始生成数据。生成结束后会得到一个文件夹，即`path/to/output` 里面存放了所有需要的信息。至此Documents目录已经没有用了，可以删除。

![image](https://github.com/tsycnh/WeChatExporter/blob/master/imgs/for%20readme/soft2.png)

Step6:点击左上角为微信备份回到主页点击显示聊天记录，输入刚到导出的output目录，即可开始查看导出的聊天记录了。

之后再查看直接进入显示聊天记录页面即可。

![image](https://github.com/tsycnh/WeChatExporter/blob/master/imgs/for%20readme/soft3.png)

### 四、疑难问题

1. 当你出现困难时，先确保是否认真并仔细的阅读了这片文档的每一个字，如果没有，就再读一遍。  
2. 试着搜索来解决你的问题。  
3. 在软件中的右上角 \[工具\]->\[导出运行日志\] 查看日志，试着从日志中解决自己的问题。最常见的问题就是版本不符的问题。  
4. 提issue，请仔细描述问题及自身环境，并附上运行日志内容。  

---
#### 待添加功能

* soft1和soft2合并 ✔
* 为微信用户添加头像 ✔ 
* 为微信用户添加昵称 ✔
* 导出html功能
* 聊天查看页面增加图像点击放大 ✔
