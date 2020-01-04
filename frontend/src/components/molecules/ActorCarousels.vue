<template>
  <v-row justify="center">
    <v-col cols="12" md="3" sm="3">
      <carousels
        v-if="$vuetify.breakpoint.smAndUp"
        :actor-images="actorImages"
        :show-arrows="false"
        :model-val="model - 1"
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
        v-if="$vuetify.breakpoint.smAndUp"
        :actor-images="actorImages"
        :show-arrows="false"
        :model-val="model + 1"
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
      required: true,
      default: () => null
    },
    model: {
      type: Number,
      required: true
    }
  },
  data: () => ({}),
  methods: {
    // 中央画像が変更された場合、左右の画像も同時に変更する
    handler: function(newVal) {
      this.$emit("update", newVal)
      // this.model = newVal
    }
  }
}
</script>
