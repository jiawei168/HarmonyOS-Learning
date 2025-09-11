@Component
export struct TextTest{
  @State content: string = '这是一段文本内容'
  @State newContent: string = '这是切换后的内容'
  @State flag: boolean = true
  @State url: Resource = $r('app.media.car')
  build(){
    Column(){
      Text('这是一段文字')
        .fontSize(16)
        .border({width:2})
        .padding(10)
        .width(300)
      Text(this.content)
        .decoration({type: TextDecorationType.Underline,color:Color.Green})
        .fontColor(Color.Pink)
        .fontSize(25)
      Image(this.url)
        .width(200)
        .height(200)
        .borderRadius('50%')

      Button('点击内容切换')
        .width(160)
        .backgroundColor(Color.Green)
        .onClick(() => {
          if(this.flag) {
            this.content = this.newContent
            this.flag = !this.flag
          }else{
            this.content = '这是一段内容'
            this.flag = !this.flag
          }

        })
      Button('点击图片切换')
        .width(160)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          if(this.flag) {
            this.url = $r('app.media.newCar')
            this.flag = !this.flag
          }else{
            this.url = $r('app.media.car')
            this.flag = !this.flag
          }

        })

    }
  }
}