<template>
  <v-container>
    <title-text text="キャスト一覧" />

    <div class="text-center">
      <pagination
        :current-page="pagination.current_page"
        :total-pages="pagination.total_pages"
        :input-method="changePage"
      />
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
    <div class="text-center">
      <pagination
        :current-page="pagination.current_page"
        :total-pages="pagination.total_pages"
        :input-method="changePage"
      />
    </div>
  </v-container>
</template>

<script>
import TitleText from "@/components/atoms/texts/Title"
import Pagination from "@/components/atoms/paginations/Paginations"
import ActorCard from "@/components/molecules/ActorCard"
import JsonApi from "devour-client"

export default {
  name: "ActorList",
  components: {
    TitleText,
    ActorCard,
    Pagination
  },
  props: {
    actors: {
      type: Array,
      required: true,
      default: () => null
    },
    pagination: {
      type: Object,
      required: true,
      default: () => null
    }
  },
  data: () => ({
    height: 300,
    flex: 12,
    md: 3,
    sm: 4
  }),
  methods: {
    changePage: async function(pageNumber) {
      // TODO: 親コンポーネントと同じメソッドを使っているので、共通化する
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

      let { data, meta } = await jsonApi.findAll("actors", {
        page: pageNumber
      })
      this.$parent.actors = data
      this.$parent.pagination = meta.pagination
    }
  }
}
</script>
