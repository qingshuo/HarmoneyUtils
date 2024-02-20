import router from '@ohos.router'
import DiyChild from '../view/DiyChild';



@Entry
@Component
struct Home{

  // 只有被@Entry 装饰的组件被可以调用页面的生命周期
  onPageShow(){
    // 页面每次显示时触发
    console.info('Index onPageShow');
  }

  onPageHide(){
    // 页面每次隐藏时触发一次
    console.info('Index pnPageHide');
  }

  onBackPress(){
    // 当用户点击返回按钮时触发
    console.info('Index onBackPress');
  }

  aboutToAppear(){
    // 组件即将出现时回调该接口,具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行
    console.info('Index aboutToAppear');
  }

  aboutToDisappear(){
    // 在自定义组件即将析构销毁时执行
    console.info('Index aboutToDisappear');
  }


  build(){
    Column(){
      Flex({direction:FlexDirection.Column,
        wrap:FlexWrap.Wrap,
        justifyContent:FlexAlign.SpaceAround,
        alignContent:FlexAlign.Center}){
        DiyChild();
        Button('sample1')
          .type(ButtonType.Normal)
          .borderRadius(5)
          .fontSize(50)
          .padding(10)
          .onClick(()=>{
            console.log(" sample Button onclick")
          })

        Button('sample2')
          .type(ButtonType.Normal)
          .borderRadius(5)
          .fontSize(50)
          .padding(10)
          .onClick(()=>{
            console.log(" sample Button onclick")
          })

        Button('sample3')
          .type(ButtonType.Normal)
          .borderRadius(5)
          .fontSize(50)
          .padding(10)
          .onClick(()=>{
            console.log(" sample Button onclick")
          })



      }.width('100%')
      .height('50%')
      .backgroundColor(Color.Orange)

      Row(){
        Text('111111')
          .width('100%')
          .height('50%')
          .fontSize(50)
          .fontColor(Color.White)
          .backgroundColor(Color.Brown)
          .onClick(()=>{
            this.routerBackIndex()
          })
      }
      .alignItems(VerticalAlign.Center)

    }.justifyContent(FlexAlign.Center)
  }

  routerBackIndex(){

    router.back();

  }

}