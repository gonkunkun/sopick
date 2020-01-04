<template>
  <v-row justify="center" style="height: 100%;">
    <v-col cols="12" md="3" sm="3">
      <carousels
        :actor-images="actorImages"
        :show-arrows="false"
        :model-val="model - 1"
        v-if="$vuetify.breakpoint.smAndUp"
      />
    </v-col>
    <v-col cols="12" md="4" sm="6">
      <carousels
        :actor-images="actorImages"
        :model-val="model"
        @update="handler"
      />
    </v-col>
    <v-col cols="12" md="3" sm="3">
      <carousels
        :actor-images="actorImages"
        :show-arrows="false"
        :model-val="model + 1"
        v-if="$vuetify.breakpoint.smAndUp"
      />
    </v-col>
  </v-row>
</template>

<script>
import Carousels from "@/components/atoms/images/Carousels"

export default {
  name: "ActorCarousels",
  components: {
    Carousels
  },
  props: {
    actorImages: {
      type: Array,
      required: false,
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
