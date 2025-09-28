import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = '鸿蒙基础开发练习';

  // ① 与截图顺序完全一致
  private pageList: Array<pageType> = [
    { name: 'ImageDemo',   label: '图片示例',   icon: $r('app.media.background1') },
    { name: 'FileOperationDemo', label: '文件示例', icon: $r('app.media.background2') },
    { name: 'TimerDemo',  label: '倒计时示例',  icon: $r('app.media.background3') },
    { name: 'ListDemo', label: '列表示例', icon: $r('app.media.foreground5') },
  ];

  build() {
    RelativeContainer() {
      // 顶部标题
      Text(this.message)
        .id('title')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .alignRules({ top: { anchor: '__container__', align: VerticalAlign.Top } })
        .margin({ top: 32, left: 80})

      // 列表
      List({ space: 12 }) {
        ForEach(this.pageList, (item: pageType) => {
          ListItem() {
            Row() {
              Image(item.icon)
                .margin({ right: 16 })
                .width(50)
                .height(50)

              Text(item.label)
                .fontSize(16)
                .fontColor('#333')
                .layoutWeight(1)

              Image($r('app.media.right'))
                .width(20)
                .height(20)

            }
            .width('100%')
            .padding(16)
            .backgroundColor('#FFF')
            .borderRadius(12)
            .onClick(() => {
              // ② 仅在此处补路径，其余不动
              router.pushUrl({ url: `pages/${item.name}` });
            })
          }
        })
      }
      .id('list')
      .alignRules({
        top: { anchor: 'title', align: VerticalAlign.Bottom },
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      })
      .padding({ top:24,left: 24, right: 24, bottom: 24 })
      .backgroundColor('#F5F5F5')
      .edgeEffect(EdgeEffect.Spring)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}

interface pageType {
  name: string,
  label: string,
  icon: Resource
}