import webview from '@ohos.web.webview'
import emitter from '@ohos.events.emitter'
import { MDialogEmitter } from '../constant/MConstant'


@CustomDialog
export default struct MWebviewDialog {
  controller?: CustomDialogController
  webviewController: webview.WebviewController = new webview.WebviewController()
  weburl: string | Resource;
  ports: webview.WebMessagePort[];
  cancel: () => void

  aboutToAppear() {
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  build() {
    Column() {


      Web({ src: this.weburl, controller: this.webviewController })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .width('100%')
        .height('100%')

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}


// 展示 dialog
export function MWebDialogShow(url: string | Resource) {


  emitter.emit({
    eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE,
    priority: emitter.EventPriority.IMMEDIATE
  }, {
    data: {
      "eventName": MDialogEmitter.MUI_DialogEmitter_EventName_Webview,
      "show": true,
      "url": url
    }
  });

}

// 关闭 dialog
export function MWebDialogClose() {

  emitter.emit({
    eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE,
    priority: emitter.EventPriority.IMMEDIATE
  }, {
    data: {
      "eventName": MDialogEmitter.MUI_DialogEmitter_EventName_Webview,
      "show": false
    }
  });

}


