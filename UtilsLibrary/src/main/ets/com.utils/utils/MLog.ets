import hilog from '@ohos.hilog'

class MLog {
  private domain: number
  private prefix: string
  private format: string = '%{public}s, %{public}s'
  isShowLog: boolean = true;

  constructor(prefix: string) {
    this.prefix = prefix
    this.domain = 0xff00
  }

  /**
   * 日志输出, 使用日志开关
   * @param value
   */
  i(...value: any[]) {


    if (this.isShowLog == true) {
      console.info(this.prefix, value);
    }
  }

  /**
   * 日志输出, 没有开关直接输出
   * @param value
   */
  fi(...value: any[]) {
    console.info(this.prefix, value)
  }
}

export default new MLog('[MUtilsLog]');
