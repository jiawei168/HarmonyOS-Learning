// view/UserProfile.ets
import { UserInfo } from '../model/UserInfo'
import pasteboard from '@ohos.pasteboard'
import promptAction from '@ohos.promptAction'

@Component
export struct UserProfile {
  @Prop userInfo: UserInfo
  @State isPressed: boolean = false

  build() {
    Row() {
      /* 1. 左侧头像 */
      Stack() {
        Image(this.userInfo.avatar)
          .width(56)
          .height(56)
          .borderRadius(28)
          .border({ width: 2, color: '#fff' })
          .shadow({ radius: 4, color: 0x40000000 })
      }
      .width(72)
      .height('100%')
      .alignContent(Alignment.Center)

      /* 2. 中间信息 */
      Column() {
        Text(this.userInfo.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .constraintSize({ maxWidth: '100%' })

        Text(`${this.userInfo.age} 岁`)
          .fontSize(14)
          .opacity(0.75)
          .margin({ top: 2 })

        if (this.userInfo.email) {
          Text(this.userInfo.email)
            .fontSize(12)
            .opacity(0.65)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ top: 2 })
            .constraintSize({ maxWidth: '100%' })
        }
      }
      .layoutWeight(1)
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 12 })

      /* 3. 右侧按钮 */
      Button(this.userInfo.active ? '禁用' : '启用')
        .width(64)
        .height(32)
        .borderRadius(16)
        .backgroundColor(this.userInfo.active ? '#FF6B6B' : '#51CF66')
        .fontColor('#fff')
        .fontSize(14)
        .onClick(() => {
          this.userInfo.active = !this.userInfo.active
        })
    }
    .height(76)
    .width('90%')
    .margin({ left: 18, top: 12 })
    .padding({ left: 12, right: 12 })
    .borderRadius(20)
    .backgroundColor('#FFFFFF')
    .shadow({
      radius: this.isPressed ? 14 : 8,
      color: this.isPressed ? 0x33000000 : 0x20000000
    })
    .scale({
      x: this.isPressed ? 0.97 : 1,
      y: this.isPressed ? 0.97 : 1
    })
    .animation({ duration: 200, curve: Curve.EaseOut })
    .onTouch((event: TouchEvent) => {
      if (event.type === TouchType.Down) this.isPressed = true
      if (event.type === TouchType.Up || event.type === TouchType.Cancel) this.isPressed = false
    })
    .gesture(
      TapGesture({ count: 2 })
        .onAction(() => {
          const text =
            `姓名：${this.userInfo.name}\n` +
              `年龄：${this.userInfo.age} 岁\n` +
              (this.userInfo.email ? `邮箱：${this.userInfo.email}\n` : '')
          const data = pasteboard.createData(
            pasteboard.MIMETYPE_TEXT_PLAIN,
            text
          )
          pasteboard.getSystemPasteboard().setData(data)
          promptAction.showToast({ message: '复制成功', duration: 1500 })
        })
    )
  }
}