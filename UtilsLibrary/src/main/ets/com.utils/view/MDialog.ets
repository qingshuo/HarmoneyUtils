import emitter from '@ohos.events.emitter'
import { MDialogEmitter } from '../constant/MConstant'

@Preview
@CustomDialog
export default struct MDialog {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text('我的内容啊，内容').fontSize(20).margin({ top: 10, bottom: 10 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel').onClick(() => {

          this.controller.close()
          this.cancel();

        }).backgroundColor(Color.White).fontColor(Color.Black)

        Button('confirm').onClick(() => {
          this.controller.close()
          this.confirm()
        }).backgroundColor(Color.White).fontColor(Color.Black)

      }.margin({ bottom: 10 })

    }.backgroundColor(Color.White)
    .margin(20).borderRadius(10)
  }
}


// 展示 dialog
export function MDialogShow(message?: string) {

  emitter.emit({
    eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE,
    priority: emitter.EventPriority.IMMEDIATE
  }, {
    data: {
      "eventName": MDialogEmitter.MUI_DialogEmitter_EventName_DIALOG,
      "show": true,
    }
  });

}

// 展示 dialog
export function MDialogClose() {

  emitter.emit({
    eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE,
    priority: emitter.EventPriority.IMMEDIATE
  }, {
    data: {
      "eventName": MDialogEmitter.MUI_DialogEmitter_EventName_DIALOG,
      "show": false
    }
  });

}