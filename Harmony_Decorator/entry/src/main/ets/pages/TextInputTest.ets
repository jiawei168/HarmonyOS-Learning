
@Component
export struct TextInputTest{
  @State username: string = 'aaa';
  build() {
   Column({space:8}){
     TextInput({ placeholder: '请输入文本内容', text: this.username })
       .onChange((val: string) => {
         this.username = val // 3. 手动回写 → 实现双向
       })
     TextInput({placeholder:'请输入密码'})
       .type(InputType.Password)
     TextInput({placeholder:'请输入电话号码'})
       .type(InputType.PhoneNumber)
       .backgroundColor(Color.Orange)
   }
  }
}