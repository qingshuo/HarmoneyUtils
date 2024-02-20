
import MLog from '../utils/MLog';
@Entry
@Component
struct GridPages {


  // 只有被@Entry 装饰的组件被可以调用页面的生命周期
  onPageShow() {
    // 页面每次显示时触发
    console.info('Index onPageShow');
  }

  onPageHide() {
    // 页面每次隐藏时触发一次
    console.info('Index pnPageHide');
  }

  onBackPress() {
    // 当用户点击返回按钮时触发
    console.info('Index onBackPress');
  }

  aboutToAppear() {
    // 组件即将出现时回调该接口,具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行
    console.info('Index aboutToAppear');
  }

  aboutToDisappear() {
    // 在自定义组件即将析构销毁时执行
    console.info('Index aboutToDisappear');
  }

  @State Numble: Array<string> = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']

  @Styles testStyle(){
    .backgroundColor(Color.Gray)
    .width('100%')
    .height('100%')


  }

  build() {

    Row() {


      Column({ space: 5 }) {
        Grid() {
          GridItem() {
            Text('1').testStyle().textAlign(TextAlign.Center).fontSize(30)
          }

          GridItem() {
            Text('2').testStyle().textAlign(TextAlign.Center).fontSize(30)
          }

          GridItem() {
            Text('3').testStyle().textAlign(TextAlign.Center).fontSize(30)
          }

          GridItem() {
            Text('4').testStyle().textAlign(TextAlign.Center).fontSize(30)
          }

          GridItem() {
            Text('5').testStyle().textAlign(TextAlign.Center).fontSize(30)
          }


          ForEach(this.Numble, (num: string) => {

            if (num === 'a') {
              GridItem() {
                Button(num).testStyle().align(Alignment.Center).fontSize(30)
              }.columnStart(1).columnEnd(2)
            } else {
              GridItem() {
                Button(num)
                  .testStyle()
                  .align(Alignment.Center)
                  .fontSize(30)
              }.onClick(()=>{
                MLog.i(" 点击了 GridItem")
              })
            }

          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('100%')
        .height('70%')
        .rowsTemplate('1fr 1fr 1fr 1fr')
        .layoutDirection(GridDirection.Column)
        .onClick(()=>{
          MLog.i(" 点击了 Grid")
        })

      }
    }.justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Brown)
    .width('100%')
    .height('100%')

  }
}