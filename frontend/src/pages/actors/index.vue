<template>
  <v-container fluid>
    <v-row>
      <actors-list />
    </v-row>
  </v-container>
</template>

<script>
import { mapActions } from "vuex"
import Healthcheck from "@/plugins/axios/modules/healthcheck"
import ActorsList from "@/components/organisms/ActorsList"

export default {
  components: {
    ActorsList
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
