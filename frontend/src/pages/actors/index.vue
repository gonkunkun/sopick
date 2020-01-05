<template>
  <v-container fluid>
    <v-row>
      <actors-list :actors="actors" :pagination="pagination" />
    </v-row>
  </v-container>
</template>

<script>
// import { mapState } from "vuex"
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
  // computed: {
  //   ...mapState("actors", ["searchValues", "getThisPage"])
  // },
  created() {
    console.log(this.asyncData())
  },
  methods: {
    async asyncData() {
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
