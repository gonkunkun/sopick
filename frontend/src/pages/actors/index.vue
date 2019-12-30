<template>
  <v-container fluid>
    <v-row>
      <actors-list :actors="actors" :pagination="pagination" />
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
    actors: [],
    pagination: {},
    links: {}
  }),
  created() {
    console.log(this.fetch())
  },
  methods: {
    async fetch() {
      // const response = await ActorsRepository.getActors()
      // this.actors = response.data
      console.log("actors/index.vue")
      console.log(this.actors)

      const jsonApi = new JsonApi({ apiUrl: "http://localhost:3031" })
      jsonApi.define("actor", {
        id: "",
        brothel_id: "",
        girl_id: "",
        name: "",
        age: "",
        tall: "",
        bust: "",
        cup: "",
        waist: "",
        hip: "",
        actor_page_url: "",
        updated_at: "",
        brothel: {
          jsonApi: "hasOne",
          type: "brothel"
        },
        actor_images: {
          jsonApi: "hasMany",
          type: "actor_image"
        }
      })
      jsonApi.define("brothel", {
        brothel_name: "",
        brothel_name_en: "",
        brothel_url: "",
        prefecture: "",
        area: "",
        area_en: "",
        area_id: "",
        area_detail_id: "",
        brothel_type: ""
      })
      jsonApi.define("actor_image", {
        image_path: "",
        updated_at: ""
      })

      let { data, meta, links } = await jsonApi.findAll("actors")
      console.log(data)
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
