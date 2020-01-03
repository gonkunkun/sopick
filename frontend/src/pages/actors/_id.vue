<template>
  <v-container fluid>
    <p>テストページ</p>
    <nuxt-link to="/actors">
      トップへ戻る
    </nuxt-link>
  </v-container>
</template>

<script>
import { RepositoryFactory } from "@/repositories/RepositoryFactory"
const ActorsRepository = RepositoryFactory.get("actors")

export default {
  async asyncData({ route, app }) {
    // let { data, meta, links } = 
    await ActorsRepository.getActorById(`${route.params.id}`)
    console.log(data)
    console.log(meta)
    console.log(links)
    console.log(route)
    console.log(app)
  },
  computed: {},
  methods: {
    handleClick(post) {
      this.$router.push(`/posts/${post.id}`)
    }
  }
}
</script>

<style></style>
