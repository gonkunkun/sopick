<template>
  <v-container fluid>
    <v-row>
      <actors-list :actors="actors" :pagination="pagination" />
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
    actors: [],
    pagination: {},
    links: {}
  }),
  created() {
    console.log(this.fetch())
  },
  methods: {
    async fetch() {
      let { data, meta, links } = await ActorsRepository.getActors()
      this.actors = data
      this.pagination = meta.pagination
      this.links = links
    }
  }
}
</script>

<style scoped>
.form-content {
  margin: 16px 0;
}
</style>
