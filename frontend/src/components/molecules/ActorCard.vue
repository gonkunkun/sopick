<template>
  <v-card>
    <atom-image
      :actor="actor"
      :age="actor.age"
      :tall="actor.tall"
      :bust="actor.bust"
      :cup="actor.cup"
      :waist="actor.waist"
      :hip="actor.hip"
      :src="actor.src"
      :name="actor.name"
      :height="height"
    />
    <v-card-actions>
      <vuetify-chip />
      <v-spacer />
      <!-- TODO: AtomsをまとめてMoleculesとする -->
      <!-- TODO: タグを追加する -->
      <vuetify-icon icon="mdi-heart" color="gray" />
      <!-- <vuetify-icon icon="mdi-bookmark" color="orange" /> -->
      <!-- <vuetify-icon icon="mdi-share-variant" color="indigo" /> -->
    </v-card-actions>
  </v-card>
</template>

<script>
import AtomImage from "@/components/atoms/images/Image"
import VuetifyIcon from "@/components/atoms/icons/VuetifyIcon"
import VuetifyChip from "@/components/atoms/chips/VuetifyChip"

export default {
  name: "ActorCard",
  components: {
    AtomImage,
    VuetifyIcon,
    VuetifyChip
  },
  props: {
    actor: {
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
