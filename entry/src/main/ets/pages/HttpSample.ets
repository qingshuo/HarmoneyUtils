import http from '@ohos.net.http'
import SampleConstant from '../data/SampleConstant'
import MLog from '../utils/MLog';

@Entry
@Component
struct HttpSample {
  build() {
    Row() {
      Column() {

        Flex({ justifyContent: FlexAlign.SpaceAround }) {


          Button('SendData', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              console.log("Index Button 1232112321")

              this.sendHttpData("test")
            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)
        }.margin({ bottom: 10 })

      }
    }.height('100%')
    .width('100%')
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)
  }

  // 联网数据发送
  sendHttpData(data: string) {


  }
}
