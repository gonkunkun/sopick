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
import { RepositoryFactory } from "@/repositories/RepositoryFactory"
const ActorsRepository = RepositoryFactory.get("actors")

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
      let { data, meta } = await ActorsRepository.getActors(pageNumber)
      this.$parent.actors = data
      this.$parent.pagination = meta.pagination
    }
  }
}
</script>
