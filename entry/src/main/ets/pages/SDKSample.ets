import SampleConstant from '../data/SampleConstant';
import MLog from '../utils/MLog';
import { MInterface } from '@utilslibrary/mutils';

@Entry
@Component
struct SDKSample {


  // 只有被@Entry 装饰的组件被可以调用页面的生命周期
  onPageShow() {
    // 页面每次显示时触发
    console.info('Index onPageShow');

  }

  onPageHide() {
    // 页面每次隐藏时触发一次
    console.info('Index pnPageHide');
  }

  onBackPress() {
    // 当用户点击返回按钮时触发
    console.info('Index onBackPress');
  }

  aboutToAppear() {
    // 组件即将出现时回调该接口,具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行
    console.info('Index aboutToAppear');
  }

  aboutToDisappear() {
    // 在自定义组件即将析构销毁时执行
    console.info('Index aboutToDisappear');
  }

  @Styles SDKSample(){
    .backgroundColor(Color.Gray)
    .width('100%')
    .height('100%')


  }

  @State sdkButtons: string[] = ["loading", "dialog", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"];

  build() {
    Row() {
      GridRow({ breakpoints: {
        value: ['320vp', '520vp', '840vp', '1080vp'],
        reference: BreakpointsReference.WindowSize
      }, gutter: 10 }) {

        ForEach(this.sdkButtons, (btnString, index) => {
          GridCol({
            span: {
              sm: 3,
              md: 3,
              lg: 3,
              xl: 3,
              xxl: 3,
            }
          }) {
            Row() {

              Button(btnString, { type: ButtonType.Normal, stateEffect: true })
                .onClick(() => {
                  this.GridRowOnClick(index)
                })
                .borderRadius(8)
                .height(40)

            }
          }
        })
      }
    }
    .backgroundColor(Color.Gray)
    .height('100%')
  }

  GridRowOnClick(index: number) {
    MLog.i(SampleConstant.SampleLogTag, " GridRowOnClick index:" + index)

    switch (index) {
      case 0:
        MLog.i(SampleConstant.SampleLogTag, " GridRowOnClick loading")

        MInterface.getInstance(getContext()).MShowLoading("1.0.0")
        break;

      case 1:
        MLog.i(SampleConstant.SampleLogTag, " GridRowOnClick tip")
        MInterface.getInstance(getContext()).MTip()
        break;

    }
  }
}