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
      :actor-image="actor.actor_images[0].image_path"
      :name="actor.name"
      :height="height"
      :url="actor.actor_page_url"
    />
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
