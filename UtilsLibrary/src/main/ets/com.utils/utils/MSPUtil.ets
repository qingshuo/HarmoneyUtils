// Preferences
import preferences from '@ohos.data.preferences';

export class MSPUtil {
  public static FILE_NAME: string = "m_sp_data";
  private msp: preferences.Preferences

  public constructor(context: Context) {
    preferences.getPreferences(context, MSPUtil.FILE_NAME).then(preference => {
      this.msp = preference
    })
  }

  public static getInstance(context?: Context): MSPUtil {

    if (globalThis.__msputil__ == undefined) {
      globalThis.__msputil__ = new MSPUtil(context??globalThis.context)
    }
    return globalThis.__msputil__
  }

  put(k: string, v: MSPUtilValueType) {
    this.msp.put(k, v, () => {
      this.msp.flush()
    })

  }

  async get<T extends MSPUtilValueType>(k: string, d: T): Promise<T> {

    return await new Promise((ret) => {
      this.msp.has(k, (e, r) => {
          !e && r ?
        this.msp.get(k, d, (e, v) => {
            !e ? ret(v as T) : ret(d)
        }) : ret(d)
      })
    })
  }

  delete(k: string) {
    this.msp.delete(k);
  }
}


export type MSPUtilValueType = string | boolean | number;