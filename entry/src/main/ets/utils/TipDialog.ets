@CustomDialog
@Preview
export default struct TipDialog {
  @State title: string = "title"
  @State message: string = "this.message"
  @State hideCancel: Boolean = false
  @State canelBtnText: string = "Cancel"
  @State ConfirmBtntext: string = "Confirm"
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  // cancel(event: (event?: ClickEvent) => void): T;


  build() {
    Column() {
      Text(this.title).fontSize(20).margin({ top: 10, bottom: 10 })

      Text(this.message).fontSize(20).margin({ top: 10, bottom: 10 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {

        if (!this.hideCancel) {
          Button(this.canelBtnText)
            .onClick(() => {
              this.controller.close()
              this.cancel()
            }).backgroundColor(Color.White).fontColor(Color.Black)
        }


        Button(this.ConfirmBtntext)
          .onClick(() => {

            this.controller.close()
            this.confirm()

          }).backgroundColor(Color.White).fontColor(Color.Black)


      }.margin({ bottom: 10 })

    }
  }
}