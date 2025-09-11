import { ItemCar } from '../components/ItemCar';
import { PreviewTest } from './PreviewTest';
import { SettingsPanel } from './SettingsPanel';
import {TextInputTest} from './TextInputTest'
import { TextTest } from './TextTest';
import router from '@ohos.router'
@Entry
@Component
struct Index {
  pageStack: NavPathStack = new NavPathStack();
  @State message: string = 'Hello World';
  @State list: Array<ItemCar> = [
    {id: 1, title: '汽车1',   img: $r('app.media.car'),    desc: '炫酷跑车'},
    {id: 2, title: '汽车2',   img: $r('app.media.newCar'), desc: '跑车'}];
  @State isDarkMode: boolean = false
  @State fontSize: number = 16
  build() {
    Scroll() {                       // ① 可滚动容器
      Column({ space: 5 }) {        // ② 真正的竖直布局
        Text(this.message)
        TextInputTest()
        TextTest()
        PreviewTest({ list: this.list })
        Text('当前设置')
          .fontSize(this.fontSize)
          .fontColor(this.isDarkMode ? Color.White : Color.Black)

        SettingsPanel({
          isDarkMode: $isDarkMode, // 使用$传递Link
          fontSize: $fontSize
        })
        Button('去详情页')
          .onClick(() => {
            router.push({
              url: 'pages/PreviewTest',
              params: { id: 1, title: '来自首页' } // 可选传参
            })
          })
      }
      .backgroundColor(this.isDarkMode ? Color.Black : Color.White)
      }
      .width('100%')
      .padding(12)
    // 占满剩余屏幕
  }
}