@Component
@Entry
export struct ColumnDemo {
  build() {
    Column({ space: 12 }) {
      Text('签到提醒')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)

      Text('上课前5分钟扫码签到')
        .fontSize(14)
        .fontColor('#F0F0F0')
        .maxLines(2)
        .lineHeight(18)

      Button('提醒')
        .type(ButtonType.Normal)
        .width(80)
        .height(32)
        .margin({ top: 16 })
        .backgroundColor('#5d91bf')
    }
    .width('100%')
    .height('60%')
    .padding(20)
    .backgroundColor('#7598d7')
    .borderRadius(16)
    .shadow({ radius: 8, color: '#30000000' })
  }
}