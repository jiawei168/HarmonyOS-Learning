import {MyButton} from '../components/MyButton'
import { UserInfo } from '../components/UserInfo'
import { UserList } from '../components/UserList'

@Entry
@Component
struct Index {
  @Prop isOnline: boolean = true

  build() {
    Column(){ /* 1. 输入框 */


      // Text(this.isOnline ? "在线" : "离线")
      // UserInfo({name:'zhangsan',age:18 })
      // MyButton()
      UserList()
    }
  }
}