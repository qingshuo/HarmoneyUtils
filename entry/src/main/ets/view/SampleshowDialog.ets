import SampleConstant from '../data/SampleConstant';
import MLog from '../utils/MLog'
import emitter from '@ohos.events.emitter';


export class CustomDialogCallback {
  confirmCallback: Function = () => {
  };
  cancelCallback: Function = () => {
  };
}

@Component
export struct LoadingView {
  @Provide dialogCallBack: CustomDialogCallback = new CustomDialogCallback();
  loadingDialog: CustomDialogController = new CustomDialogController({
    builder: LoadingProgressDialog(),
    autoCancel: true,
    customStyle: true
  });

  aboutToAppear() {
    let innerEvent = {
      eventId: 1
    };

    emitter.on(innerEvent, (eventData) => {

      MLog.i(SampleConstant.SampleLogTag, " innerEvent:" + JSON.stringify(innerEvent))

      if (eventData.data.showLoad) {
        if (this.loadingDialog) {
          this.loadingDialog.open();
        }
      } else {
        if (this.loadingDialog) {
          this.loadingDialog.close()
        }
      }
    })
  }

  aboutToDisappear() {
    emitter.off(1)
  }

  build() {

  }
}

@CustomDialog
export struct LoadingProgressDialog {
  controller: CustomDialogController = new CustomDialogController({ builder: '' })

  build() {
    Column() {
      LoadingProgress().width(80).height(80).color(Color.Brown)

      Text("加载中...").margin({ top: 20, bottom: 20 })
    }
    .width(140)
    .height(160)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)

  }
}
