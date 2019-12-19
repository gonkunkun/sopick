<template>
  <v-card>
    <atom-image :src="card.src" :title="card.title" :height="height" />
    <v-card-actions>
      <v-spacer />

      <!-- TODO: AtomsをまとめてMoleculesとする -->
      <!-- TODO: タグを追加する -->
      <heart />
      <bookmark />
      <share-variant />
    </v-card-actions>
  </v-card>
</template>

<script>
import AtomImage from "@/components/atoms/Image"
import Heart from "@/components/atoms/Heart"
import Bookmark from "@/components/atoms/icons/Bookmark"
import ShareVariant from "@/components/atoms/ShareVariant"

export default {
  name: "ActorCard",
  components: {
    AtomImage,
    Heart,
    Bookmark,
    ShareVariant
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
