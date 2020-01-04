<template>
  <v-card>
    <nuxt-link :to="`/actors/${actor.id}`">
      <atom-images-garary
        :actor="actor"
        :age="actor.age"
        :tall="actor.tall"
        :bust="actor.bust"
        :cup="actor.cup"
        :waist="actor.waist"
        :hip="actor.hip"
        :actor-images="actor.actor_images"
        :name="actor.name"
        :height="height"
      />
    </nuxt-link>
    <v-card-actions>
      <vuetify-chip
        :brothel-type="actor.brothel.brothel_type.attributes.name"
      />
      <v-spacer />
      <!-- TODO: AtomsをまとめてMoleculesとする -->
      <!-- TODO: タグを追加する -->
      <vuetify-icon
        icon="mdi-open-in-new"
        color="pink"
        :url="actor.actor_page_url"
      />
      <!-- <vuetify-icon icon="mdi-bookmark" color="orange" /> -->
      <!-- <vuetify-icon icon="mdi-share-variant" color="indigo" /> -->
    </v-card-actions>
  </v-card>
</template>

<script>
import AtomImagesGarary from "@/components/atoms/images/ImagesGarary"
import VuetifyIcon from "@/components/atoms/icons/VuetifyIcon"
import VuetifyChip from "@/components/atoms/chips/VuetifyChip"

export default {
  name: "ActorCard",
  components: {
    AtomImagesGarary,
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
  },
  methods: {}
}
</script>

<style scoped>
a {
  text-decoration: none;
}
a:hover {
  text-decoration: none;
}
</style>
