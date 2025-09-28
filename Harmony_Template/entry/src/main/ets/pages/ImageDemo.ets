// 图片展示页面
import router from '@ohos.router';
@Entry
@Component
struct ImageDemo {
  @State imageDesc: string = "HarmonyOS系统架构示意图"

  build() {
    Column() {
      Image($r('app.media.foreground6')) // 图片需放在resources/base/media目录
        .width(300)
        .height(200)
        .margin(20)

      Text(this.imageDesc)
        .fontSize(20)
        .fontColor(Color.Blue)

      Button('返回')
        .onClick(() => router.back())
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}