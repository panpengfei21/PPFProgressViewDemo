# PPFProgressViewDemo

[GitHub]([https://github.com/panpengfei21/PPFProgressViewDemo](https://github.com/panpengfei21/PPFProgressViewDemo)
)
## 效果
![效果图](https://upload-images.jianshu.io/upload_images/2261768-98a0081eb02da148.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 引入
```
pod 'PPFGradualProgressView', '~> 0.0.2'
```

或
```
直接摘取`PPFGradualProgressView.swift`
```

## 使用

```
let pv = PPFGradualProgressView(frame: CGRect(x: 100, y: 150, width: 200, height: 30))
// 设置渐变色
pv.setColors([UIColor.red,UIColor.purple])
// 设置bar的高度
pv.setBarHeight(40)
// 设置轨道的颜色
pv.setTrackColor(UIColor.gray)
// 设置比例
pv.setRate(0.8)
view.addSubview(pv)
```
