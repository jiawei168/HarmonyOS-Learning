import { it } from '@ohos/hypium'
import { ItemCar } from '../components/ItemCar'
import { cloudCommon } from '@kit.CloudFoundationKit'
import router from '@ohos.router'
@Entry
@Component
@Preview
export struct PreviewTest {
  @State content: string = '这是一段文本内容'
  @Prop list: Array<ItemCar> = [
  ]
  build() {
   Column() {
     Text(this.content)
       .width(200)
     Button('返回上一页')
       .onClick(() => router.back())
     Button('这是一个按钮')
       .width(200)
    List(){
       ForEach(this.list,(item: ItemCar) => {
         ListItem(){
           Column(){
             Text(item.title)
             Text(item.desc)
             Image(item.img)
               .width(100)
               .height(100)
               .borderRadius('50%')
           }
           .width(300)

           .borderRadius(12)
           .margin(20)
           .border({width:1,color:Color.Orange})
         }

       })
    }
     .width('100%')
   }
  }
}