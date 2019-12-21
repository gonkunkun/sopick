<template>
  <v-card>
    <atom-image :src="card.src" :title="card.title" :height="height" />
    <v-card-actions>
      <v-spacer />

      <!-- TODO: AtomsをまとめてMoleculesとする -->
      <!-- TODO: タグを追加する -->
      <vuetify-icon icon="mdi-heart" color="pink" />
      <vuetify-icon icon="mdi-bookmark" color="orange" />
      <vuetify-icon icon="mdi-share-variant" color="indigo" />
    </v-card-actions>
  </v-card>
</template>

<script>
import AtomImage from "@/components/atoms/Image"
import VuetifyIcon from "@/components/atoms/icons/VuetifyIcon"

export default {
  name: "ActorCard",
  components: {
    AtomImage,
    VuetifyIcon
  },

  props: {
    card: {
      type: Object,
      required: true,
      default: () => null
    },
    height: {
      type: Number,
      required: false,
      default: () => 300
    }
  }
}
</script>
