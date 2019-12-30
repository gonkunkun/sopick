<template>
  <v-container fluid>
    <v-row>
      <actors-list :actors="actors" />
    </v-row>
  </v-container>
</template>

<script>
import ActorsList from "@/components/organisms/ActorsList"
// import { RepositoryFactory } from "@/repositories/RepositoryFactory"
// const ActorsRepository = RepositoryFactory.get("actors")
import JsonApi from "devour-client"

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
      // const response = await ActorsRepository.getActors()
      // this.actors = response.data
      console.log("actors/index.vue")
      console.log(this.actors)

      const jsonApi = new JsonApi({ apiUrl: "http://localhost:3031" })
      jsonApi.define("actor", {
        name: "",
        duration: "",
        brothel: {
          jsonApi: "hasOne",
          type: "brothel"
        }
      })
      // jsonApi.define("actor", {
      //   name: "",
      //   movieActors: {
      //     jsonApi: "hasMany",
      //     type: "movieActors"
      //   },
      //   movies: {
      //     jsonApi: "hasMany",
      //     type: "movies"
      //   }
      // })
      // jsonApi.define("genre", {
      //   name: "",
      //   movies: {
      //     jsonApi: "hasMany",
      //     type: "genres"
      //   }
      // })
      // jsonApi.define("director", {
      //   name: "",
      //   movies: {
      //     jsonApi: "hasMany",
      //     type: "directors"
      //   }
      // })
      let { data, errors, meta, links } = jsonApi.findAll("actors", "index")
      console.log(data)
      return { data, errors, meta, links }
    }
  }
}
</script>

<style scoped>
.form-content {
  margin: 16px 0;
}
</style>
