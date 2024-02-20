import WebviewDialog from '../view/WebviewDialog'


@Entry
@Component
struct WebviewSample {
  // webviewController: webview.WebviewController = new webview.WebviewController()
  webviewdialog: CustomDialogController

  build() {
    Column() {

      Row() {

        Button("test")
          .type(ButtonType.Normal)
          .borderRadius(5)
          .fontSize(50)
          .padding(10)
          .onClick(() => {

            console.log(" sample Button onclick")

            this.showWebviewDialog()
          })

      }.height('100%')
      .width('100%')
      .backgroundColor(Color.Transparent)

      // Row() {
      //
      //   Web({ src: 'www.baidu.com', controller: this.webviewController })
      //     .width('100%')
      //     .height('100%')
      //     .backgroundColor(Color.Red)
      //
      //
      // }.backgroundColor(Color.Grey)
      // .height('90%')
      // .width('100%')

    }.height('100%')
    .width('100%')
    .backgroundColor(Color.Red)
  }


  // 打开webview
  showWebviewDialog() {

    this.webviewdialog = new CustomDialogController(
      {
        builder: WebviewDialog({}),
        offset: { dx: 0, dy: 0 },
        customStyle: true

      })
    this.webviewdialog.open()
  }
}