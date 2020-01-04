<template>
  <v-container fluid>
    <v-row>
      <actor-detail :actor="actor" />
    </v-row>
  </v-container>
</template>

<script>
import ActorDetail from "@/components/organisms/ActorDetail"
import { RepositoryFactory } from "@/repositories/RepositoryFactory"
const ActorsRepository = RepositoryFactory.get("actors")

export default {
  components: {
    ActorDetail
  },
  asyncData: async function({ route }) {
    let { data } = await ActorsRepository.getActorById(`${route.params.id}`)
    return { actor: data }
  },
  data: () => ({}),
  computed: {},
  created() {},
  methods: {}
}
</script>

<style></style>
