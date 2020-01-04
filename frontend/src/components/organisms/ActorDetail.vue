<template>
  <v-container>
    <title-text text="キャスト詳細" />
    <actor-carousels :actor-images="actor.actor_images" />
    <nuxt-link to="/actors">
      トップへ戻る
    </nuxt-link>
  </v-container>
</template>

<script>
import TitleText from "@/components/atoms/texts/Title"
import ActorCarousels from "@/components/molecules/ActorCarousels"

export default {
  name: "ActorDetail",
  components: {
    TitleText,
    ActorCarousels
  },
  props: {
    actor: {
      type: Object,
      required: true,
      default: () => null
    }
  },
  data: () => ({}),
  methods: {}
}
</script>
