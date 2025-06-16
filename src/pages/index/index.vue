<template>
  <view class="container">
    <textarea class="text-input" v-model="text" placeholder="请输入要朗读的内容" :maxlength="500" show-confirm-bar="false" />
    <button class="speak-btn" @click="speak()">开始朗读</button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      text: ''
    }
  },
  methods: {
    // 主入口
    speak() {
      this.speakH5(this.text)
    },
    // H5 端
    speakH5(text) {
      if ('speechSynthesis' in window) {
        const utter = new window.SpeechSynthesisUtterance(text)
        utter.lang = 'zh-CN'
        window.speechSynthesis.cancel() // 停止之前的朗读
        window.speechSynthesis.speak(utter)
      } else {
        uni.showToast({ title: '当前浏览器不支持语音合成', icon: 'none' })
      }
    },
  }
}
</script>

<style>
.container {
  padding: 30rpx;
  background-color: #f8f8f8;
  min-height: 100vh;
}

.text-input {
  width: 100%;
  height: 300rpx;
  background-color: #ffffff;
  border-radius: 16rpx;
  padding: 24rpx;
  box-sizing: border-box;
  font-size: 28rpx;
  line-height: 1.5;
  box-shadow: 0 2rpx 12rpx rgba(0, 0, 0, 0.05);
  margin-bottom: 30rpx;
}

.speak-btn {
  width: 100%;
  height: 88rpx;
  line-height: 88rpx;
  background: linear-gradient(to right, #4a90e2, #5cb3ff);
  color: #ffffff;
  font-size: 32rpx;
  border-radius: 44rpx;
  border: none;
  box-shadow: 0 4rpx 12rpx rgba(74, 144, 226, 0.3);
  transition: all 0.3s ease;
}

.speak-btn:active {
  transform: scale(0.98);
  box-shadow: 0 2rpx 8rpx rgba(74, 144, 226, 0.2);
}
</style>