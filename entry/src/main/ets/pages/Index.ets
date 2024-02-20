import router from '@ohos.router'

import TipDialog from '../utils/TipDialog'
import promptAction from '@ohos.promptAction'
import { fullScreenDialog } from '../view/fullScreenDialog'
import SampleConstant from '../data/SampleConstant'
import MLog from '../utils/MLog';
import testentry from '../data/testentry'
import { MDialogEmitter, MUIDistribute } from '@utilslibrary/mutils';
import SampleDialog from '../view/SampleDialog'

@Entry
@Component
struct Index {
  @State message: string = 'Hello '
  @State title: string = ''
  tipdialogController: CustomDialogController
  fulldialog: CustomDialogController = new CustomDialogController({
    builder: fullScreenDialog({
      slotContent: () => {
        this.componentBuilder()
      },
      slotBgColor: Color.Pink.toString(),
    }),
    offset: { dx: 0, dy: 0 },
    customStyle: true
  })

  build() {
    Row() {
      Column() {

        Flex({ justifyContent: FlexAlign.SpaceAround }) {


          Button('GridPages', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "11111111111111111", "  2222 ", "  33333")
              this.routerPages("pages/GridPages")


            })
            .borderRadius(8)
            .width(90)
            .height(40)
            .margin(5)


          Button('Home', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              console.log("Index Button 1232112321")

              this.routerPages("pages/Home")
            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


          Button('HttpSample', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              console.log("Index Button 1232112321")

              this.routerPages('pages/HttpSample')
            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


        }.margin({ bottom: 10 })

        Flex({ justifyContent: FlexAlign.SpaceAround }) {

          Button('UtilsSample', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              console.log("Index Button 1232112321")

              this.routerPages('pages/UtilsSample')
            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


          Button('UtilsNativeEncode', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "Index Button UtilsNativeEncode")

              new testentry().testadd()

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


          Button('SDKSample', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "Index Button SDKSample")
              this.routerPages('pages/SDKSample')

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)

        }.margin({ bottom: 10 })


        Flex({ justifyContent: FlexAlign.SpaceAround }) {

          Button('Dialog', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              console.log("Dialog Button 1232112321")
              this.showDialog('sssssssssssss')
            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)

          Button('Toast', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {

              promptAction.showToast({ message: "show toast", duration: 2000 })

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


          Button('ShowDialog', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {

              this.showsampledialog()

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


        }.margin({ bottom: 10 })

        Flex({ justifyContent: FlexAlign.SpaceAround }) {

          Button('webview', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "WebviewSample")

              this.routerPages("pages/WebviewSample")

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)


          Button('JSON', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "JSONSample")

              this.routerPages("pages/JSONSample")

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)

          Button('全屏dialog', { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              MLog.i(SampleConstant.SampleLogTag, "WebviewSample")

              this.fulldialog.open()

            })
            .borderRadius(8)
            .backgroundColor(Color.Orange)
            .width(90)
            .height(40)
            .margin(5)

        }.margin({ bottom: 10 })

      }

      // LoadingView().id("load")

      MUIDistribute().id(MDialogEmitter.MUI_DialogEmitter_IDName)

    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)

  }

  oncanCel() {
    MLog.i(SampleConstant.SampleLogTag, " tipdialogController cancel")
    this.tipdialogController = undefined
  }

  /**
   * 跳转到Home pages
   */
  routerPages(pagesurl: string) {

    console.log("Index routerPages start ")
    router.pushUrl({
      url: pagesurl
    }, router.RouterMode.Single, (err) => {
      if (err) {
        console.error(`Invoke pushUrl failed, code is ${err.code} ,message id ${err.message}`);
        return;
      }
      console.info('Invoke pushUrl succeeded.');
    });
  }

  showsampledialog() {
    this.tipdialogController = new CustomDialogController({
      builder: SampleDialog({
        cancel: this.oncanCel,
        confirm: () => {
          MLog.i(SampleConstant.SampleLogTag, " tipdialogController confirm")
          this.tipdialogController = undefined
        }
      }),
      cancel: null,
      autoCancel: true,
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: -20 },
      gridCount: 4,
      customStyle: false
    })
    this.tipdialogController.open()

  }

  onCancel() {

  }

  onAccept() {

  }

  showDialog(message: string) {

    this.tipdialogController = new CustomDialogController({
      builder: TipDialog({
        title: "我是标题",
        message: "我是内容",
        hideCancel: false,
        canelBtnText: '取消',
        ConfirmBtntext: '确定',
        cancel: this.oncanCel,
        confirm: () => {
          MLog.i(SampleConstant.SampleLogTag, " tipdialogController confirm")
          this.tipdialogController = undefined
        }
      }),
      cancel: null,
      autoCancel: true,
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: -20 },
      gridCount: 4,
      customStyle: false
    })
    this.tipdialogController.open()
  }

  @Builder componentBuilder() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Text('这里是全屏弹窗').fontSize(24).textAlign(TextAlign.Center).margin(30)
        Column() {
          Text('我是全屏弹窗， 可以自定义ui，可以内置webview 啥的')
            .fontSize(20)
        }.margin({ left: 10, right: 10 })

      }.position({ x: 0, y: 0 })
      .height('100%')
      .width('100%')

    }
  }

  // private async createWindow(namestr: string, windowType: number, rect) {
  //   console.log("createWindow execute")
  //   try {
  //     // 创建window
  //     //getContext(), name, windowType
  //     const win = await window.createWindow({ name: namestr, ctx: getContext(), windowType: windowType })
  //     globalThis.extensionWin = win
  //     // 将弹窗绑定至拉起方
  //     win.showWindow()
  //     await win.bindDialogTarget(globalThis.want.parameters["ohos.ability.params.token"].value, () => {
  //
  //       // 应用销毁，分享服务也销毁
  //       getContext().terminateSelf()
  //     })
  //     await win.moveTo(rect.left, rect.top)
  //     await win.resetSize(rect.width, rect.height)
  //     await win.loadContent('pages/share')
  //     await win.setBackgroundColor("#00000000")
  //     await win.show()
  //     console.log("window create successfully")
  //   } catch {
  //     console.info("window create failed")
  //   }
  // }


}

// function SampleDialog(arg0: {
//   cancel: any;
//   confirm: any
// }): any {
//   throw new Error('Function not implemented.')
// }
