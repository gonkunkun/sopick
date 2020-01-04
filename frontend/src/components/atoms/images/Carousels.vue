<template>
  <div>
    <v-carousel
      v-model="model"
      v-touch:swipe.left="prevImage"
      v-touch:swipe.right="nextImage"
      dark
      :hide-delimiters="hideDelimiters"
      :show-arrows="showArrows"
    >
      <v-carousel-item
        v-for="(item, i) in actorImages"
        :key="i"
        :src="item.image_path"
      />
    </v-carousel>
  </div>
</template>

<script>
export default {
  name: "AtomCarousels",
  props: {
    actorImages: {
      type: Array,
      required: false,
      default: () => null
    },
    hideDelimiters: {
      type: Boolean,
      required: false,
      default: () => true
    },
    showArrows: {
      type: Boolean,
      required: false,
      default: () => true
    },
    modelVal: {
      type: Number,
      required: false,
      default: () => 1
    }
  },
  data: function() {
    return {
      model: this.modelVal
    }
  },
  watch: {
    // 中央画像が変更された場合、左右の画像も同時に変更する
    model: function(newVal) {
      this.$emit("update", newVal)
    },
    // 親のprops更新に応じて、modelの値を最新化する
    modelVal: function() {
      this.model = this.modelVal
    }
  },
  methods: {
    nextImage: function() {
      // 配列の後ろまで到達してしまった場合には、先頭に戻る
      if (0 < this.model) {
        // 配列上の次の要素の画像を表示
        this.model--
      } else {
        this.model = this.actorImages.length - 1
      }
    },
    prevImage: function() {
      // 配列の後ろまで到達してしまった場合には、先頭に戻る
      if (this.model + 1 < this.actorImages.length) {
        // 配列上の次の要素の画像を表示
        this.model++
      } else {
        this.model = 0
      }
    }
  }
}
</script>

<style scoped></style>
