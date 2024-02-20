import worker from '@ohos.worker'
import SampleConstant from '../data/SampleConstant'

@CustomDialog
export default struct SampleDialog {
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
    }
  }
}



