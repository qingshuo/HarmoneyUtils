import emitter from '@ohos.events.emitter';
import { MDialogEmitter } from '../constant/MConstant';

@CustomDialog
export struct MLoadingDialog {
  controller: CustomDialogController = new CustomDialogController({ builder: '' })
  @State message: string = "加载中...";

  build() {
    Column() {
      LoadingProgress().width(80).height(80).color(Color.Brown)

      Text(this.message).margin({ top: 20, bottom: 20 })
    }
    .width(140)
    .height(160)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)

  }
}

// 展示loading
export function MLoadingShow(message: string) {

  emitter.emit({
    eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE,
    priority: emitter.EventPriority.IMMEDIATE
  }, {
    data: {
      "eventName": MDialogEmitter.MUI_DialogEmitter_EventName_Loading,
      "show": true,
      "showMessage": message
    }
  });

}

// 展示loading
export function MLoadingClose() {

  emitter.emit({
    eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE,
    priority: emitter.EventPriority.IMMEDIATE
  }, {
    data: {
      "eventName": MDialogEmitter.MUI_DialogEmitter_EventName_Loading,
      "show": false
    }
  });

}