@Entry
@Component
@Preview
struct SlideCard {
  /* ====== 状态 ====== */
  @State isMoved: boolean = false;
  @State flag: boolean = false;
  @State isY: number = 500;
  @State isExpanded: boolean = false;          // 是否展开
  readonly DURATION: number = 800;             // 动画时长
  readonly BOTTOM_OFFSET: number = 300;        // 收起时向下偏移（模拟贴底）
  readonly MIDDLE_OFFSET: number = 0;          // 展开时到屏幕中央

  /* ====== 计算属性 ====== */
  private get translateY(): number {
    return this.isExpanded ? this.MIDDLE_OFFSET : this.BOTTOM_OFFSET;
  }

  build() {
    Navigation() {
      Stack() {                                // 全屏层叠，方便定位
        // 背景占位，让 Stack 撑满
        Row()               // 或 Column()
          .layoutWeight(1)  // 撑满剩余空间

        // 卡片容器
        Column() {
          // 标题栏（始终可见）
          Row() {
            Text('今日待办')
              .fontSize(18)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .padding(16)

          .backgroundColor('#666')
          .borderRadius({ topLeft: 12, topRight: 12 })
          .onClick(() => {
              this.isMoved = !this.isMoved
              this.isExpanded = !this.isExpanded

          })

          // 展开时才显示的任务列表
          if (this.isExpanded) {
            Column({ space: 12 }) {
              Text('1. 完成 ArkUI 动画练习')
              Text('2. 提交代码到仓库')
              Text('3. 复习状态管理')
            }
            .padding({ left: 16, right: 16, bottom: 20 })
            .transition({ type: TransitionType.Insert, opacity: 0, scale: { x: 0.8, y: 0.8 } })
          }
        }
        .width('90%')
        .backgroundColor('#f5f5f5')
        .borderRadius(12)
        .shadow({ radius: 10, color: '#20000000' })
        .translate({ y: this.translateY })   // 核心：位移驱动
        .animation({
          duration: this.DURATION,
          curve: Curve.EaseInOut
        })
        .onClick(() => {
          // 整个卡片可点，避免点任务文字无响应
          this.isExpanded = !this.isExpanded;
        })
      }.translate({
        x:0,y:this.isMoved?0:this.isY
      })


      .animation({
        duration:1200,//动画时长
        curve:Curve.Friction,//阻尼动画
        delay:500,//延迟500ms
        // iterations: -1, //设置-1表示无限循环
        playMode: PlayMode.Alternate,//播放模式，循环播放
        expectedFrameRateRange:{
          min:20,
          max:120,
          expected:90,
        }}
      )
      .alignContent(Alignment.Bottom)      // 卡片默认在底部
    }
    .title('滑动提示卡片')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
  }
}