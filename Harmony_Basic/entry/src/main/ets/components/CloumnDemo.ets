@Component
struct RowDemo{
  build() {
    Row({space:8}){
      Image($r('app.media.car'))
        .width(24)
        .height(24)
      Text('鸿蒙开发')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .layoutWeight(1)
      Button('详情')
        .type(ButtonType.Capsule)
        .width(60)
        .height(20)

    }
    .padding({left:20,right:20})
    .width(300)
    .height(60)
    .backgroundColor('#ff5d91bf')
  }
}