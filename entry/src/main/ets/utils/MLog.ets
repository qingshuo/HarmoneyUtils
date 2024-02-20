import hilog from '@ohos.hilog'

class MLog {
  private domain: number
  private prefix: string
  private format: string = '%{public}s, %{public}s'
  public static isShowLog: Boolean = true;

  constructor(prefix: string) {
    this.prefix = prefix
    this.domain = 0xff00
  }

  i(...value: any[]) {
    if (MLog.isShowLog) {
      console.info(this.prefix, value);
    }
  }
}

export default new MLog('[SampleSDK]');
