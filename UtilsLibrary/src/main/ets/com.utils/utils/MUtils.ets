/**
 * 工具类，
 * 基础工具类,提供一些基础方法
 */
import HashMap from '@ohos.util.HashMap';
import display from '@ohos.display';
import Intl from '@ohos.intl';
import common from '@ohos.app.ability.common';
import util from '@ohos.util';

class MUtils {


  // uuid
  static getUUID(): string {
    let uuid = util.generateRandomUUID(true);
    return uuid;
  }

  /**
   * 获取随机密钥
   * @returns
   */
  static getSecretKey() {
    let mKeyItem: string = "abcdefghijklmnopqrstuvwxyz1234567890";
    let result = ""
    for (let i = 0; i < 8; i++) {
      result += mKeyItem.charAt(MUtils.Rand(0, 36))
    }

    return result
  }

  /**
   * 获取随机密钥
   * @returns
   */
  static get32RandomString() {
    let mKeyItem: string = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789"
    let result = ""
    for (let i = 0; i < 32; i++) {
      result += mKeyItem.charAt(MUtils.Rand(0, mKeyItem.length))
    }
    return result
  }

  /**
   * 获取随机数
   * @param Min
   * @param Max
   * @returns
   */
  static Rand(Min: number, Max: number) {
    switch (Min) {
      case 0:
        return Math.round(Math.random() * Max)
      case 1:
        return Math.ceil(Math.random() * Max)
      default:
        return Math.round(Math.random() * (Max - Min) + Min)
    }
  }

  static mapToString(value: HashMap<string, string>): string {

    return JSON.stringify(this.mapToJSon(value))

  }

  static mapToJSon(value: HashMap<string, string>) {

    let ro = {}
    value.forEach((keyvalue, key) => {
      ro[key] = keyvalue
    });

    return ro

  }

  // 获取屏幕尺寸
  static getScreenSize(): string {
    let displayClass = display.getDefaultDisplaySync();
    return displayClass.width + "*" + displayClass.height;
  }

  // 是否是空字符串
  static isEmpty(value: string): boolean {
    if (value == undefined || value.length <= 0) {
      return true
    }
    return false
  }

  /**
   * 字符串格式化，用于获取公用header信息时，吧null的换成0。
   */
  static getNotNull(value: string): string {
    if (!MUtils.isEmpty(value)) {
      return value;
    }
    return ""
  }

  /**
   * 字符串格式化，用于获取公用header信息时，吧null的换成0。
   */
  static getHeaderValue(value: string): string {
    if (!MUtils.isEmpty(value)) {
      return value;
    }
    return "0"
  }

  // 设备当前语言
  static getLocale() {
    let locale = new Intl.Locale();

    return locale.baseName
  }

  static WebViewDataDeCode(data: string): string {

    return data
  }

  static WebViewDataEnCode(data: string): string {
    return data
  }

  // 获取时间戳
  static getTimeInMillis(): number {
    var dateNow = new Date();
    let requestTimeStamp = dateNow.getTime()
    return requestTimeStamp;
  }

  // 格式化时间yyyyMMddHHmmss
  static getTimeDate(): string {
    var dateNow = new Date();
    return this.formatDateTime(dateNow);
  }

  // 打开浏览器
  static async implicitStartAbility(uri: string) {
    try {
      let want = {
        // uncomment line below if wish to implicitly query only in the specific bundle.
        // bundleName: "com.example.myapplication",
        "action": "ohos.want.action.viewData",
        // entities can be omitted.
        "entities": ["entity.system.browsable"],
        "uri": uri,
        "type": "*"
      }
      let context = getContext() as common.UIAbilityContext;
      await context.startAbility(want)
      console.info(`explicit start ability succeed`)
    } catch (error) {
      console.info(`explicit start ability failed with ${error.code}`)
    }
  }

  static formatDateTime(date) {
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 月份从0开始，不足两位补0
    var day = date.getDate().toString().padStart(2, '0'); // 日期不足两位补0
    var hours = date.getHours().toString().padStart(2, '0'); // 小时不足两位补0
    var minutes = date.getMinutes().toString().padStart(2, '0'); // 分钟不足两位补0
    var seconds = date.getSeconds().toString().padStart(2, '0'); // 秒不足两位补0

    return year + month + day + hours + minutes + seconds;
  }
}

export default MUtils