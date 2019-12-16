<template>
  <v-container fluid>
    <v-row class="mx-auto d-flex flex-column">
      <div class="my-4">
        <v-btn color="primary" @click="healthcheck">
          ヘルスチェック
        </v-btn>
      </div>
    </v-row>
    <v-row>
      <actors-card />
    </v-row>
  </v-container>
</template>

<script>
import { mapActions } from "vuex"
import Healthcheck from "@/plugins/axios/modules/healthcheck"
import ActorsCard from "@/components/ActorsCard"

export default {
  components: {
    ActorsCard
  },
  asyncData({ redirect, store }) {
    if (store.getters["user"]) {
      redirect("/")
    }
    return {
      isCreateMode: false,
      formData: {
        id: ""
      }
    }
  },
  computed: {},
  methods: {
    // ヘルスチェック
    healthcheck() {
      Healthcheck.healthcheck()
        .then(response => {
          console.log(response)
        })
        .catch(error => {
          console.log(error)
        })
    },
    ...mapActions(["login", "register"])
  }
}
</script>

<style scoped>
.form-content {
  margin: 16px 0;
}
</style>
