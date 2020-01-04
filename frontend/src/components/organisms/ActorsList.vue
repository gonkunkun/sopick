<template>
  <v-container>
    <title-text text="キャスト一覧" />
    <!-- 検索機能追加 -->
    <v-btn @click="testFunc">
      test
    </v-btn>
    <v-row>
      <v-col cols="12" sm="6" md="6">
        <v-select
          v-model="typeValue"
          :items="typeItems"
          attach
          chips
          label="業種"
          multiple
        />
      </v-col>
      <v-col ccols="12" sm="6" md="6">
        <v-select
          v-model="areaValue"
          :items="areaItems"
          attach
          chips
          label="都道府県"
          multiple
        />
      </v-col>
    </v-row>
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
const BrothelTypesRepository = RepositoryFactory.get("brothelTypes")

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
    sm: 4,
    typeItems: ["foo", "bar", "fizz", "buzz"],
    typeValue: [],
    areaItems: ["foo", "bar", "fizz", "buzz"],
    areaValue: []
  }),
  methods: {
    async asyncData() {
      let { brothelTypes } = await BrothelTypesRepository.getBrothelTypes()
      console.log(brothelTypes)
    },
    changePage: async function(pageNumber) {
      let { data, meta } = await ActorsRepository.getActors(pageNumber)
      this.$parent.actors = data
      this.$parent.pagination = meta.pagination
    },
    testFunc: function() {
      let { brothelTypes } = BrothelTypesRepository.getBrothelTypes()
      console.log(brothelTypes)
    }
  }
}
</script>
