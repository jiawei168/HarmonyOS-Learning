@Entry
@Component
export struct MyButton {
  build() {
    Row({space: 10}){
      Button('主要按钮')
        .type(ButtonType.Normal)
        .backgroundColor('#ff4bd4cd')
      Button('次要按钮')
        .type(ButtonType.Normal)
        .backgroundColor('#ffe5dada')
      Button('危险按钮')
        .type(ButtonType.Normal)
        .backgroundColor('#ffec0f0f')
    }
  }
}
