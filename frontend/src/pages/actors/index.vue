<template>
  <v-container fluid>
    <v-row>
      <actors-list :actors="actors" />
    </v-row>
  </v-container>
</template>

<script>
import ActorsList from "@/components/organisms/ActorsList"
import { RepositoryFactory } from "@/repositories/RepositoryFactory"
const ActorsRepository = RepositoryFactory.get("actors")

export default {
  components: {
    ActorsList
  },
  data: () => ({
    actors: []
  }),
  created() {
    this.fetch()
  },
  methods: {
    async fetch() {
      const response = await ActorsRepository.getActors()
      this.actors = response.data
      console.log("actors/index.vue")
      console.log(this.actors)
    }
  }
}
</script>

<style scoped>
.form-content {
  margin: 16px 0;
}
</style>
