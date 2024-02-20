import emitter from '@ohos.events.emitter'
import { MBaseConstant, MDialogEmitter } from '../constant/MConstant';
import { MXLog } from '../utils/MXLog';
import MDialog from './MDialog';
import { MLoadingDialog } from './MLoadingDialog';
import MWebviewDialog from './MWebviewDialog';

@Component
export struct MUIDistribute {

  // loading
  loadingDialog: CustomDialogController

  // 自定义弹出框
  mdialog: CustomDialogController

  // 用户相关 webview弹出框
  mAccountWeb: CustomDialogController

  aboutToAppear() {
    let innerEvent = {
      eventId: MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE
    };

    emitter.on(innerEvent, (eventData) => {

      MXLog.i(MBaseConstant.MLogTag, `  MUIDistribute emitter.on ${JSON.stringify(innerEvent)}   data:${JSON.stringify(eventData)}`)
      if (eventData.data.eventName == MDialogEmitter.MUI_DialogEmitter_EventName_Loading) {
        if (eventData.data.show) {
          this.loadingviewShow(eventData.data.showMessage);
        } else {
          this.loadingviewhide();
        }
      } else if (eventData.data.eventName == MDialogEmitter.MUI_DialogEmitter_EventName_DIALOG) {
        if (eventData.data.show) {
          this.mdialogShow();
        } else {
          this.mdialogHide();
        }
      } else if (eventData.data.eventName == MDialogEmitter.MUI_DialogEmitter_EventName_Webview) {
        if (eventData.data.show) {
          this.mAccountWebDialogShow(eventData.data.url);
        } else {
          this.mAccountWebDialogHide();
        }
      }
    })
  }

  aboutToDisappear() {
    emitter.off(MDialogEmitter.MUI_EMITTER_UI_DISTRIBUTE)
  }


  // loading dialog
  loadingviewhide() {
    if (this.loadingDialog != undefined) {
      this.loadingDialog.close()
      this.loadingDialog = undefined
    }
  }

  loadingviewShow(message: string) {
    if (this.loadingDialog == undefined) {
      this.loadingDialog = new CustomDialogController({
        builder: MLoadingDialog({ message: message }),
        autoCancel: true,
        customStyle: true
      });
    }
    this.loadingDialog.open()
  }

  // 自定义dialog 展示
  mdialogHide() {
    if (this.mdialog != undefined) {
      this.mdialog.close()
      this.mdialog = undefined
    }
  }

  mdialogShow() {
    if (this.mdialog == undefined) {
      this.mdialog = new CustomDialogController({
        builder: MDialog({
          cancel: () => {
          },
          confirm: () => {
          }
        }),
        autoCancel: false,
        customStyle: true,
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: -20 },
        gridCount: 4,
      });
    }

    this.mdialog.open()
  }


  // webview 提示框展示
  mAccountWebDialogHide() {
    if (this.mAccountWeb != undefined) {
      this.mAccountWeb.close()
      this.mAccountWeb = undefined
    }
  }

  mAccountWebDialogShow(url: string | Resource) {
    if (this.mAccountWeb == undefined) {
      this.mAccountWeb = new CustomDialogController({
        builder: MWebviewDialog({
          weburl: url,
          cancel: () => {
          }
        }),
        autoCancel: false,
        customStyle: true,
        alignment: DialogAlignment.Center,
        gridCount: 4,
      });
    }

    this.mAccountWeb.open()
  }

  build() {
  }
}