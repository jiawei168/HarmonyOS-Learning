import {MyButton} from '../components/MyButton'
@Entry
@Component
struct Index {
  @Prop isOnline: boolean = true
  build() {
    Column(){
      Text(this.isOnline ? "在线" : "离线")
      MyButton()
    }
  }
}