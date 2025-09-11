import { UserInfo } from "../model/UserInfo"
import { UserProfile } from "./UserProfile"

@Entry
@Component
export struct UserList {
  @State keyword: string = ''
  @State userInfoList: UserInfo[] = [
    {
      id: 1,
      name: '李111111111111111111111111111111111111111111111111111111111111',
      age: 18,
      avatar: $r('app.media.car'),
      active: true
    },
    {
      id: 2,
      name: '朱2',
      age: 18,
      email: '253163****@qq.com11111111111111111111111111111111111111111111',
      avatar: $r('app.media.car'),
      active: false
    }
  ]

  build() {
    Column() {
      TextInput({
        placeholder: '请输入搜索关键字',
        text: this.keyword // 用于双向绑定
      })
        .width('90%')
        .height(48)
        .backgroundColor('#ffe2e1e1')
        .borderRadius(12)
        .padding({ left: 16, right: 16 })
        .margin({ top: 12, bottom: 12 })
        .onChange((val: string) => {
          this.keyword = val
        })
      List() {
        ForEach(this.userInfoList, (item: UserInfo) => {
          ListItem() {
            UserProfile({ userInfo: item })
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
    // ✅ 左右 16 vp 外边距 + 底部 24 vp 外边距
    .margin({ left: 16, right: 16, bottom: 24 })
  }
}