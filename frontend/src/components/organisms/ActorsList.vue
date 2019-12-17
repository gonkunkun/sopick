<template>
  <v-container fluid>
    <v-row>
      <v-col
        v-for="card in cards"
        :key="card.title"
        :cols="card.flex"
        :md="card.md"
      >
        <actor-card :card="card" :height="height" />
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
  data: () => ({
    height: 300,
    cards: [
      {
        title: "Pre-fab homes",
        src: "https://cdn.vuetifyjs.com/images/cards/house.jpg",
        flex: 12,
        md: 12
      },
      {
        title: "Favorite road trips",
        src: "https://cdn.vuetifyjs.com/images/cards/road.jpg",
        flex: 12,
        md: 8
      },
      {
        title: "Best airlines",
        src: "https://cdn.vuetifyjs.com/images/cards/plane.jpg",
        flex: 12,
        md: 4
      },
      {
        title: "Best airlines",
        src: "https://cdn.vuetifyjs.com/images/cards/plane.jpg",
        flex: 12,
        md: 4
      },
      {
        title: "Best airlines",
        src: "https://cdn.vuetifyjs.com/images/cards/plane.jpg",
        flex: 12,
        md: 8
      },
      {
        title: "Best airlines",
        src: "https://cdn.vuetifyjs.com/images/cards/plane.jpg",
        flex: 12,
        md: 4
      }
    ]
  })
}
</script>
