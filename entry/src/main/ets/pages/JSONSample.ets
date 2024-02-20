import SampleConstant from '../data/SampleConstant'
import MLog from '../utils/MLog';


export interface BaseResponse<T> {
  data: T
  errorCode?: string
  errorDesc: string
  status: string
}



@Entry
@Component
struct JSONSample {
  build() {
    Row() {
      Column() {

        Flex({ justifyContent: FlexAlign.SpaceAround }) {


          Button('SendData', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {

              MLog.i(SampleConstant.SampleLogTag, " JSONSample  SendData test ");

              this.testJson()

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

  replaceJsonStr(data: any): string {
    var resultStr = JSON.stringify(data).replace(/\\\\/g, '\\');
    resultStr = resultStr.replace(/\\"/g, '"');
    resultStr = resultStr.replace(/"{/g, '{');
    resultStr = resultStr.replace(/}"/g, '}');
    resultStr = resultStr.replace(/\\"/g, '"');
    return resultStr;
  }

  async testJson() {

    var restestjson = await getContext().resourceManager.getStringSync($r('app.string.testJson'))

    var testjsonStr: string = this.replaceJsonStr(restestjson)
    MLog.i(SampleConstant.SampleLogTag, "  testJson :" + testjsonStr)

    var testJson = JSON.parse(testjsonStr)

    if (testJson.key1 == undefined) {
      MLog.i(SampleConstant.SampleLogTag, "  testJson.key1 == undefined")
    } else {
      MLog.i(SampleConstant.SampleLogTag, "  testJson.key1 != undefined")
      var key1 = testJson.key1
      MLog.i(SampleConstant.SampleLogTag, "  key1 :" + key1)
    }

    if (testJson.kkkkk == undefined) {
      MLog.i(SampleConstant.SampleLogTag, "  testJson.kkkkk == undefined")
    } else {
      MLog.i(SampleConstant.SampleLogTag, "  testJson.kkkkk != undefined")
    }


    MLog.i(SampleConstant.SampleLogTag, ` errorCode:${testJson.errorCode} errorDesc:${testJson.errorDesc} status:${testJson.status}  key1:${testJson.key1} key2:${testJson.key2}  data0:${testJson.data.datakey01}  data1:${testJson.data.datakey02}  `)


  }
}
