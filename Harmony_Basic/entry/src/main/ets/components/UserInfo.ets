@Component
@Entry
export struct UserInfo {
  @Prop name: string = ''
  @Prop age: number = 0
  build() {
    Column() {
      // 用户头像区域
      Row() {
        Image($r('app.media.car')) // 请替换为实际图片资源
          .width(80)
          .height(80)
          .borderRadius(40)
          .backgroundColor('#f0f0f0')
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20, bottom: 16 })

      // 用户姓名
      Text(this.name)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 })

      // 用户详细信息
      Column() {
        // 年龄信息
        Row() {
          Text('年龄: ')
            .fontSize(16)
            .fontColor('#666')
          Text(this.age + '岁')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
        }
        .margin({ bottom: 8 })
        .justifyContent(FlexAlign.Start)
        .width('100%')

      }
      .width('90%')
      .padding(12)
    }
    .width('90%')
    .backgroundColor(Color.White)
    .borderRadius(12)
    .padding(20)
  }
}