<template>
  <v-container>
    <title-text text="キャスト詳細" />
    <actor-carousels
      :actor-images="actor.actor_images"
      :model="model"
      @update="handler"
    />
    <v-container style="max-height: 400px" class="overflow-y-auto">
      <v-row align="center" justify="center">
        <images-list :actor-images="actor.actor_images" @update="handler" />
      </v-row>
    </v-container>
    <nuxt-link to="/actors">
      トップへ戻る
    </nuxt-link>
  </v-container>
</template>

<script>
import TitleText from "@/components/atoms/texts/Title"
import ActorCarousels from "@/components/molecules/ActorCarousels"
import ImagesList from "@/components/molecules/ImagesList"

export default {
  name: "ActorDetail",
  components: {
    TitleText,
    ActorCarousels,
    ImagesList
  },
  props: {
    actor: {
      type: Object,
      required: true,
      default: () => null
    }
  },
  data: () => ({
    model: 1
  }),
  methods: {
    // 中央画像が変更された場合、左右の画像も同時に変更する
    handler: function(newVal) {
      this.model = newVal
    }
  }
}
</script>

<style scoped>
.v-container {
  -ms-overflow-style: none; /* IE, Edge 対応 */
  scrollbar-width: none; /* Firefox 対応 */
}
.container::-webkit-scrollbar {
  /* Chrome, Safari 対応 */
  display: none;
}
</style>
