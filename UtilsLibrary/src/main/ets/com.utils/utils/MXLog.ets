/**
 * Copyright (c) 2023 Wathinst <wxz@xkzhineng.com>
 * OhBili is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 * http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */

import { XLog, LogConfiguration, OhPrinter, LogLevel } from '@ohos/xlog';

export class MXLog {
  static init(filesDir: string) {
    let config = new LogConfiguration.Builder()
      .setTag("[MUtilsLog]")
      .setLogLevel(LogLevel.INFO)
      .build();
    // let printer = new FilePrinter.Builder(`${filesDir}/log`)
    //     .setCleanStrategy(new FileLastModifiedCleanStrategy(24 * 60 * 60 * 1000)) //24h
    //     .setFileNameGenerator(new DateFileNameGenerator())
    //     .setBackupStrategy(new FileSizeBackupStrategy(10 * 1024 * 1024)) // 10MB
    //     .build();
    XLog.init(config, [new OhPrinter()]);
  }

  static setDebug(isOpen: boolean) {
    console.info("MUtilsLog isOpen: " + isOpen);
    XLog.changeLogLevel(isOpen ? LogLevel.ALl : LogLevel.INFO)
  }

  static i(...msg: any[]) {
    XLog.i(msg.toString());
  }

  static d(...msg: any[]) {
    XLog.d(msg.toString());
  }

  static w(...msg: any[]) {
    XLog.w(msg.toString());
  }

  static e(...msg: any[]) {
    XLog.e(msg.toString());
  }
}
