@Component
struct ColumnDemo{
  build() {
    Column({space:8}){
      Text('签到提醒')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      Text('上课前5分钟扫码签到')
        .fontSize(14)
        .fontColor('#666')
        .maxLines(2)
        .layoutWeight(1)
      Button('提醒')
        .margin({top:12})
        .onClick(() => {
          console.log('允许签到');
        })

    }
    .width('100%')
    .backgroundColor('#ff7598d7')
    .borderRadius(12)
    .shadow({radius:8,color:'#f00'})
  }
}