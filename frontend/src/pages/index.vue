<template>
  <v-container fluid>
    <v-row class="mx-auto d-flex flex-column">
      <form>
        <div class="my-4">
          <v-text-field v-model="userId" label="ユーザID" />
        </div>
        <div class="my-4">
          <v-checkbox v-model="isCreateMode" :label="`アカウントを作成する`" />
        </div>
        <div class="my-4">
          <v-btn color="primary" @click="healthcheck">
            ヘルスチェック
          </v-btn>
        </div>
        <div class="my-4">
          <v-btn color="primary" @click="handleClickSubmit">
            {{ buttonText }}
          </v-btn>
        </div>
      </form>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from "vuex"
import Cookies from "universal-cookie"
import Healthcheck from "@/plugins/axios/modules/healthcheck"

export default {
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
  computed: {
    buttonText() {
      return this.isCreateMode ? "新規登録" : "ログイン"
    },
    ...mapGetters(["user"])
  },
  methods: {
    async handleClickSubmit() {
      const cookies = new Cookies()
      if (this.isCreateMode) {
        try {
          await this.register({ ...this.formData })
          this.$notify({
            type: "success",
            title: "アカウント作成完了",
            message: `${this.formData.id} として登録しました`,
            position: "bottom-right",
            duration: 1000
          })
          cookies.set("user", JSON.stringify(this.user))
          this.$router.push("/posts/")
        } catch (e) {
          this.$notify.error({
            title: "アカウント作成失敗",
            message: "既に登録されているか、不正なユーザー ID です",
            position: "bottom-right",
            duration: 1000
          })
        }
      } else {
        try {
          await this.login({ ...this.formData })
          this.$notify({
            type: "success",
            title: "ログイン成功",
            message: `${this.formData.id} としてログインしました`,
            position: "bottom-right",
            duration: 1000
          })
          cookies.set("user", JSON.stringify(this.user))
          this.$router.push("/posts/")
        } catch (e) {
          this.$notify.error({
            title: "ログイン失敗",
            message: "不正なユーザー ID です",
            position: "bottom-right",
            duration: 1000
          })
        }
      }
    },
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
