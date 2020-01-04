<template>
  <v-container>
    <title-text text="キャスト詳細" />
    <v-row justify="center" style="height: 100%;">
      <v-col cols="12" md="2" sm="3">
        <carousels
          :actor-images="actor.actor_images"
          :show-arrows="false"
          :model-val="model - 1"
        />
      </v-col>
      <v-col cols="12" md="4" sm="6">
        <carousels
          :actor-images="actor.actor_images"
          :model-val="model"
          @update="handler"
        />
      </v-col>
      <v-col cols="12" md="2" sm="3">
        <carousels
          :actor-images="actor.actor_images"
          :show-arrows="false"
          :model-val="model + 1"
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import TitleText from "@/components/atoms/texts/Title"
import Carousels from "@/components/atoms/images/Carousels"

export default {
  name: "ActorDetail",
  components: {
    TitleText,
    Carousels
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
