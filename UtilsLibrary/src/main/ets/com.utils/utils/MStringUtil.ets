import cryptoFramework from '@ohos.security.cryptoFramework';
import util from '@ohos.util';
import MUtils from './MUtils';

export class MStringUtil {
  public static replaceJsonStr(data: any): string {
    var resultStr = JSON.stringify(data).replace(/\\\\/g, '\\');
    resultStr = resultStr.replace(/\\"/g, '"');
    resultStr = resultStr.replace(/"{/g, '{');
    resultStr = resultStr.replace(/}"/g, '}');
    resultStr = resultStr.replace(/\\"/g, '"');
    return resultStr;
  }


  public static stringToUint8Array(input: string): Uint8Array {
    let arr: number[] = [];
    for (let i = 0, j = input.length; i < j; ++i) {
      arr.push(input.charCodeAt(i));
    }
    return new Uint8Array(arr);
  }

  public static md5(input: string): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      const dataBlob = {
        data: this.stringToUint8Array(input)
      };
      const encryptor = cryptoFramework.createMd("MD5");
      encryptor.update(dataBlob)
        .then(() => {
          return encryptor.digest()
        })
        .then(out => {
          resolve(out.data.toString());
        });
    });
  }


  // BASE64 URLENCODE加密
  static base64encode(data: string): string {

    if (MUtils.isEmpty(data)) {
      return "";
    }

    var that = new util.Base64Helper();
    let dataEncode = that.encodeToStringSync(this.stringToUint8Array(data))

    return encodeURIComponent(dataEncode)
  }

  //BASE64 URLDECODE解密
  static base64decode(data: string): string {
    if (MUtils.isEmpty(data)) {
      return "";
    }
    var that = new util.Base64Helper();
    let dataDecode = decodeURIComponent(data)
    let data_ = that.decodeSync(dataDecode).toString()

    return data_
  }
}