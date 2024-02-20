export class MBitTool {

  // 将字符串每个十六进制字符转化为二进制表示
  static to_4binary(text: string) {
    if (text == null) {
      return null
    }
    let binary = ""
    for (let i = 0; i < text.length; i++) {
      let charCode = parseInt(text.charAt(i), 16).toString(2)
      binary += charCode.padStart(4, '0')
    }
    return binary
  }
  // 将字符串每个字符转化为ASCII码表示
  static to_8binary(text: string) {

    if (text == null) {
      return null
    }
    let binary = ""
    for (let i = 0; i < text.length; i++) {
      let charCode = text.charCodeAt(i)
      if (charCode > 255) {
        throw new SyntaxError
      }
      binary += charCode.toString(2).padStart(8, '0')
    }
    return binary
  }
  // 二进制字符串到十六进制字符串 Char2Hex
  static to_Hex(text: string) {
    if (text == null) {
      return null
    }
    const asciiTable = MBitTool.divise(text, 4)
    let binary = ""
    for (let i = 0; i < asciiTable.length; i++) {
      let hex = parseInt(asciiTable[i], 2).toString(16)
      binary += hex
    }
    return binary
  }
  //字符串左移
  static left_move(text: string, number: number) {
    if (text == null) {
      return null
    }
    let result = ""
    for (let i = number; i < text.length; i++) {
      result += text.charAt(i)
    }
    for (let i = 0; i < number; i++) {
      result += text.charAt(i)
    }
    return result
  }

  // ASCII2Bin
  static xor(x: string, y: string) {
    let result = ""
    for (let i = 0; i < x.length; i++) {
      if (String(x).charAt(i) === String(y).charAt(i)) {
        result += "0"
      } else {
        result += "1"
      }
    }
    return result
  }

  static divise(text: string, number: number) {
    let result: string[] = []
    let temp = ""
    for (let i = 0; i < text.length; i++) {
      if (i !== 0 && i % number === 0) {
        result.push(temp)
        temp = ""
      }
      temp += text[i]
    }
    result.push(temp)
    return result
  }

  // Bin2ASCII Hex2Char
  static decimal_to_binary(hex: number) {
    let charCode = hex.toString(2)
    return charCode.padStart(4, '0')
  }
}