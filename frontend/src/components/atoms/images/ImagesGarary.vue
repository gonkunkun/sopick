<template>
  <v-img
    :src="actorImages[displayImageNumber].image_path"
    class="white--text align-end"
    :gradient="imageGradient"
    :height="height"
    @mouseenter="
      MouseOverImage()
      enterMouse()
    "
    @mouseleave="
      MouseLeaveImage()
      leaveMouse()
    "
    @click="changeImage"
  >
    <a target="_blank" :href="url">
      <v-card-title class="pink--text text--lighten-5" v-text="name" />
      <v-card-subtitle class="white--text">
        Age:{{ age }} T:{{ tall }} B:{{ bust }}({{ cup }}) W:{{ waist }} H:{{
          hip
        }}
      </v-card-subtitle>
    </a>
  </v-img>
</template>

<script>
export default {
  name: "AtomImagesGarary",
  props: {
    actor: {
      type: Object,
      required: false,
      default: () => null
    },
    actorImages: {
      type: Array,
      required: true,
      default: () => null
    },
    name: {
      type: String,
      required: true,
      default: () => "名無し"
    },
    age: {
      type: Number,
      required: false,
      default: () => 0
    },
    tall: {
      type: Number,
      required: false,
      default: () => 0
    },
    bust: {
      type: Number,
      required: false,
      default: () => 0
    },
    cup: {
      type: String,
      required: false,
      default: () => ""
    },
    waist: {
      type: Number,
      required: false,
      default: () => 0
    },
    hip: {
      type: Number,
      required: false,
      default: () => 0
    },
    height: {
      type: Number,
      required: false,
      default: () => 300
    },
    url: {
      type: String,
      required: false,
      default: () => "https://www.cityheaven.net/"
    }
  },
  data: () => ({
    imageGradient: "to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)",
    displayImageNumber: 0,
    onMouse: false
  }),
  computed: {},
  methods: {
    MouseOverImage: function() {
      this.imageGradient = "to bottom, rgba(0,0,0,.0), rgba(0,0,0,.2)"
    },
    MouseLeaveImage: function() {
      this.imageGradient = "to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
    },
    changeImage: function() {
      // 配列の後ろまで到達してしまった場合には、先頭に戻る
      if (this.displayImageNumber + 1 < this.actorImages.length) {
        // 配列上の次の要素の画像を表示
        this.displayImageNumber++
      } else {
        this.displayImageNumber = 0
      }
    },
    enterMouse: async function() {
      this.onMouse = true
      setTimeout(
        function() {
          let id = setInterval(
            function() {
              // マウスが画像上から外れていた場合には、画像を切替えずに処理を終了する
              if (!this.onMouse) {
                clearInterval(id)
              } else {
                // 画像を変更する
                this.changeImage()
              }
            }.bind(this),
            // 画像が切り替わる間隔（ms）
            "750"
          )
        }.bind(this),
        // 画像上にマウスを置いてから、ギャラリーが流れ始めるまでの時間（ms）
        "100"
      )
    },
    leaveMouse: async function() {
      this.onMouse = false
    }
  }
}
</script>

<style scoped>
.v-card {
  transition: opacity 0.4s ease-in-out;
}
.v-card:not(.on-hover) {
  opacity: 0.6;
}
.show-btns {
  color: rgba(255, 255, 255, 1) !important;
}
a {
  text-decoration: none;
}
a:hover {
  text-decoration: none;
}
</style>
