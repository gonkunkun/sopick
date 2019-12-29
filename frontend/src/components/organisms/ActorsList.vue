<template>
  <v-container>
    <div class="title py-1">
      キャスト一覧
    </div>
    <v-row>
      <v-col
        v-for="actor in actors"
        :key="actor.name"
        :cols="flex"
        :md="md"
        :sm="sm"
      >
        <actor-card :actor="actor" :height="height" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import ActorCard from "@/components/molecules/ActorCard"

export default {
  name: "ActorList",
  components: {
    ActorCard
  },
  props: {
    actors: {
      type: Array,
      required: true,
      default: () => null
    }
  },
  data: () => ({
    height: 300,
    flex: 12,
    md: 3,
    sm: 4
  })
}
</script>
