// 计时功能演示（参考搜索结果3）
import router from '@ohos.router';
@Entry
@Component
struct TimerDemo {
  @State seconds: number = 0
  @State isTiming: boolean = false
  private timerID: number = 0

  build() {
    Column({ space: 15 }) {
      Text(`已计时：${this.seconds}秒`)
        .fontSize(24)

      Button(this.isTiming ? '停止计时' : '开始计时')
        .onClick(() => this.toggleTimer())

      Button('重置')
        .onClick(() => {
          this.seconds = 0
          this.stopTimer()
        })

      Button('返回')
        .onClick(() => router.back())
    }
  }

  private toggleTimer() {
    this.isTiming ? this.stopTimer() : this.startTimer()
  }

  private startTimer() {
    this.timerID = setInterval(() => {
      this.seconds += 1
    }, 1000)
    this.isTiming = true
  }

  private stopTimer() {
    clearInterval(this.timerID)
    this.isTiming = false
  }
}