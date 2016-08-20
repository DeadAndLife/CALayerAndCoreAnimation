##CALayer(图层)和UIView之间的关系(区别)
###1.UIView可以相应事件,但是Layer却不可以
####UIKIt使用UIResponder作为响应对象,来响应系统传递过来的事件,并进行处理.UIApplication,UIViewController,,UIView和所有继承UIView的UIKIt类都直接或间接继承UIResponder类.
####CALayer直接继承了NSObject,并没有响应处理事件的接口.
###2.UIView和CALayer的frame映射
####一个Layer的frame是由他的anchorPoint ,point,bounds等决定的,而一个UIView的frame是UIView.layer返回的frame
###3.UIView主要是对显示内容的管理,CALayer只负责内容的显示或绘制.
###4.CALayer是支持隐式动画.
####在Layer做动画的时候(通过修改属性),View作为Layer的代理,Layer通过actionForLayer:forKey:向View请求响应的动画响应事件.
###5.CLayer内部维护着三个layer tree,分别是presentLayer Tree(动画树),modeLayer Tree(模型树),Render Tree(渲染树).
####在做iOS动画时,修改Layer动画的属性,其实是修改presentLayer的属性,而最终展示到UIView的界面上是modeLayer提供的