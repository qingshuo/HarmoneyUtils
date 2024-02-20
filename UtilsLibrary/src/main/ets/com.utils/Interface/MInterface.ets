import MLog from '../utils/MLog';
import { MXLog } from '../utils/MXLog';
import { MDialogShow } from '../view/MDialog';
import { MLoadingShow } from '../view/MLoadingDialog';

export class MInterface {
  private static instance: MInterface
  public mContext: Context
  webviewdialog: CustomDialogController

  constructor(context: Context) {

    this.mContext = context
    MXLog.init(this.mContext.filesDir)
  }


  public static getInstance(context?: Context): MInterface {

    if (this.instance == undefined) {
      this.instance = new MInterface(context)
    }


    return this.instance;
  }

  /**
   * 设置debug 模式
   * @param open 是否开启，默认为关闭
   */
  public setDebug(open: boolean) {
    MLog.isShowLog = open
  }

  public onCreate() {
  }

  public onDestroy() {

  }

  /**
   * showloading
   * @param value  提示语
   */
  public MShowLoading(value: string) {

    MLoadingShow(value)
  }


  public MTip() {
    MDialogShow("test")

  }
}