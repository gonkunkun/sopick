<template>
  <v-container>
    <title-text text="キャスト一覧" />
    <!-- 検索機能追加 -->
    <search-forms
      :type-items="typeItems"
      :type-value="searchValues.typeValue"
      :pref-items="prefItems"
      :pref-value="searchValues.prefValue"
      @updated="updated"
    />
    <div class="text-center">
      <pagination
        :current-page="pagination.current_page"
        :total-pages="pagination.total_pages"
        :input-method="fetchActors"
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
        :input-method="fetchActors"
      />
    </div>
  </v-container>
</template>

<script>
import { mapState } from "vuex"
import TitleText from "@/components/atoms/texts/Title"
import Pagination from "@/components/atoms/paginations/Paginations"
import ActorCard from "@/components/molecules/ActorCard"
import SearchForms from "@/components/molecules/SearchForms"
import { RepositoryFactory } from "@/repositories/RepositoryFactory"
const ActorsRepository = RepositoryFactory.get("actors")
const BrothelTypesRepository = RepositoryFactory.get("brothelTypes")
const PrefecturesRepository = RepositoryFactory.get("prefectures")

export default {
  name: "ActorList",
  components: {
    TitleText,
    ActorCard,
    SearchForms,
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
    typeItems: [],
    prefItems: []
  }),
  computed: {
    ...mapState("actors", ["searchValues"])
  },
  mounted: function() {
    this.onLoad()
  },
  methods: {
    async onLoad() {
      // 業種リストの取得
      let responseType = await BrothelTypesRepository.getBrothelTypes()
      responseType.data.forEach(item => {
        let obj = {
          value: item.attributes.id,
          text: item.attributes.name
        }
        this.typeItems.push(obj)
      })
      // 都道府県リストの取得
      let responsePref = await PrefecturesRepository.getPrefectures()
      responsePref.data.forEach(item => {
        let obj = {
          value: item.attributes.id,
          text: item.attributes.prefecture
        }
        this.prefItems.push(obj)
      })
    },
    fetchActors: async function(pageNumber) {
      let { data, meta } = await ActorsRepository.getActors(
        pageNumber,
        this.searchValues.typeValue,
        this.searchValues.prefValue
      )
      this.$parent.actors = data
      this.$parent.pagination = meta.pagination
    },
    // 検索フォームの条件変更を検知して、vuexの値を更新する
    updated: function(values, label) {
      console.log(values)
      console.log(label)
      this.$store.commit("actors/updateSearchValues", {
        values: values,
        label: label
      })
      this.fetchActors(1)
    }
  }
}
</script>
