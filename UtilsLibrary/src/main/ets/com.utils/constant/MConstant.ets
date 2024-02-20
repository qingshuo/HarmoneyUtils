
export class MBaseConstant {
  public static MLogTag: string = "MUtilsLog"
}

/**
 * UI 事件类型
 */
export class MDialogEmitter {

  //  UI分发事件
  static readonly MUI_EMITTER_UI_DISTRIBUTE = 10011;

  // UI id
  static readonly MUI_DialogEmitter_IDName = "MUIEmitterid"

  // loading 类型
  static readonly MUI_DialogEmitter_EventName_Loading = "loading"
  // 自定义 dialog
  static readonly MUI_DialogEmitter_EventName_DIALOG = "Dialog"
  // webview dialog
  static readonly MUI_DialogEmitter_EventName_Webview = "webview"
}

