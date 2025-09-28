// 列表功能演示（参考搜索结果12）
import router from '@ohos.router';
@Entry
@Component
struct ListDemo {
  @State items: string[] = ['HarmonyOS', 'ArkUI', 'Stage模型', '声明式开发', '分布式能力']

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.items, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(18)
              .padding(10)
          }
        })
      }
      .height('80%')

      Button('返回')
        .onClick(() => router.back())
    }
  }
}