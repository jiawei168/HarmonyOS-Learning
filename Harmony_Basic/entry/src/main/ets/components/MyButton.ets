@Entry
@Component
export struct MyButton {
  build() {
    Row({space: 10}){
      Button('主要按钮')
        .type(ButtonType.Normal)
        .backgroundColor('#ccc')
      Button('次要按钮')
        .type(ButtonType.Normal)
        .backgroundColor('#ccc')
      Button('危险按钮')
        .type(ButtonType.Normal)
        .backgroundColor('#ccc')
    }
  }
}
