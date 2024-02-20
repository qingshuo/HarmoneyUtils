import webview from '@ohos.web.webview'
import SampleConstant from '../data/SampleConstant'
import MLog from '../utils/MLog'


@CustomDialog
export default struct WebviewDialog {
  controller?: CustomDialogController
  webviewController: webview.WebviewController = new webview.WebviewController()
  @State weburl: string = 'https://www.baidu.com'

  build() {
    Column() {


      Web({ src: this.weburl, controller: this.webviewController })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .onWindowExit(() => {
          MLog.i(SampleConstant.SampleLogTag, " onWindowExit ")
          if (this.controller) {
            this.controller.close()
          }
        })
        .onUrlLoadIntercept((event) => {
          let url: string = event.data as string


          return false
        })
        .onProgressChange((event) => {
          let progress: number = event.newProgress as number
          MLog.i(SampleConstant.SampleLogTag, " progress:" + progress)


        })
        .onSslErrorEventReceive((event) => {
          let error = event.error
          let handler = event.handler

          MLog.i(SampleConstant.SampleLogTag, `onSslErrorEventReceive errorCode: ${error.toString()}`)

          MLog.i(SampleConstant.SampleLogTag, " onSslErrorEventReceive handler:" + handler.toString())

        })
        .onErrorReceive((event) => {
          let request = event.request
          let error = event.error

          MLog.i(SampleConstant.SampleLogTag, ` onErrorReceive getRequestHeader:${request.getRequestHeader()
            .toString()}  getRequestMethod:${request.getRequestMethod().toString()}  url:${request.getRequestUrl()} `)


          MLog.i(SampleConstant.SampleLogTag, ` onErrorReceive errorCode: ${error.getErrorCode()
            .toString()} message:${error.getErrorInfo()} `)
        })
        .onHttpErrorReceive((event) => {
          let request = event.request
          let response = event.response
          MLog.i(SampleConstant.SampleLogTag, " onHttpErrorReceive request:" + request.toString())
          MLog.i(SampleConstant.SampleLogTag, " onHttpErrorReceive response:" + response.toString())


        })
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Transparent)

    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Transparent)
  }
}