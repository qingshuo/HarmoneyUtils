import CryptoJS from '@ohos/crypto-js'
import SampleConstant from '../data/SampleConstant'
import MLog from '../utils/MLog';

@Entry
@Component
struct UtilsSample {
  pc1_table = [
    57, 49, 41, 33, 25, 17, 9,
    1, 58, 50, 42, 34, 26, 18,
    10, 2, 59, 51, 43, 35, 27,
    19, 11, 3, 60, 52, 44, 36,
    63, 55, 47, 39, 31, 23, 15,
    7, 62, 54, 46, 38, 30, 22,
    14, 6, 61, 53, 45, 37, 29,
    21, 13, 5, 28, 20, 12, 4,
  ]

  build() {
    Row() {
      Column() {

        Flex({ justifyContent: FlexAlign.SpaceAround }) {

          Button('MD5', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              var hash = CryptoJS.MD5("123456")
              MLog.i(SampleConstant.SampleLogTag, " DecryptByDESFromKey hash:" + hash)
            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)

          Button('DES-Encode', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "Index Button 1232112321")

              this.desencode('11111111111111111111111111111111')
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

  desencode(value: string) {
    

  }
}