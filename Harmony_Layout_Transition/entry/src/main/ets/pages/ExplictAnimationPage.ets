@Entry
@Component
@Preview
struct DemoPage {
  @State isMoved: boolean = false
  @State rectColor: string = '#ccc'
  @State rotateAngle: number = 0
  @State axColor: string = '#ff475d'
  @State axSize: number = 64
  @State scales: number = 1
  @State scaleY: number = 2
  build() {
    Navigation() {
      Column({ space: 16 }) {
        Text('显式动画演示')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)

        Button('改变位置').onClick(() => {
          this.isMoved = !this.isMoved
          this.rectColor = this.rectColor === 'ccc' ? 'bbb' : 'ccc'
        })
        Circle({width: 60, height: 60})
          .fill(this.circleColor)
          .translate({x:this.isMoved?200:0,y:0}) //位移变化
          .animation({ //隐式动画
            duration:1000,
            curve: Curve.Smooth //缓动函数
          })
        // 矩形（新增）
        Rect({width:60,height: 30})
          .fill(this.isMoved?Color.Blue:Color.Orange)
          .translate({ x: 0, y: this.isMoved ? 200 : 0 })

          .animation({ duration: 1000, curve: Curve.EaseIn })
        Button('角度变化')
          .onClick(() => {
            this.rotateAngle = 90
          })
          .rotate({angle:this.rotateAngle})
          .animation({
            duration:1200,//动画时长
            curve:Curve.Friction,//阻尼动画
            delay:500,//延迟500ms
            iterations: -1, //设置-1表示无限循环
            playMode: PlayMode.Alternate,//播放模式，循环播放
            expectedFrameRateRange:{
              min:20,
              max:120,
              expected:90,
            }
          })

          // 把 SVG 当普通 Image 用
          Image($r('app.media.ax'))   // 提前把 heart.svg 放到 resources/rawfile
            .width(this.axSize)
            .height(this.axSize)
            .fillColor(this.axColor)       // 动态换色
            .scale({ x: this.scales, y: this.scales })
            .animation({
              duration:1200,//动画时长
              curve:Curve.Friction,//阻尼动画
              delay:500,//延迟500ms
              iterations: -1, //设置-1表示无限循环
              playMode: PlayMode.Alternate,//播放模式，循环播放
              expectedFrameRateRange:{
                min:20,
                max:120,
                expected:90,
              }


            })
            .onAppear(() => {
              this.scales= this.scales === 1 ? 2 : 1
            })
        }

      .padding(16)
    }
    .title('显式动画')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .navBarWidth('100%')
    .navBarPosition(NavBarPosition.Start)
  }
}