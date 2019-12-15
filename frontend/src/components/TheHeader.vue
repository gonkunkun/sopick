<template>
  <div>
    <v-toolbar
      dark
      prominent
      src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"
    >
      <v-app-bar-nav-icon />
      <v-toolbar-title>Sopick</v-toolbar-title>
      <v-spacer />
      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>
      <v-btn icon>
        <v-icon>mdi-heart</v-icon>
      </v-btn>
      <v-btn text :route="{ path: '/posts/new' }">
        新規投稿
      </v-btn>
      <v-btn text :route="{ path: '/posts/' }">
        投稿一覧
      </v-btn>
      <no-ssr>
        <v-btn v-if="user" text :route="{ path: `/users/${user.id}` }">
          {{ user.id }}
        </v-btn>
        <v-btn v-else text :route="{ path: '/' }">
          ログイン
        </v-btn>
      </no-ssr>
    </v-toolbar>
  </div>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  computed: {
    ...mapGetters(["user"])
  }
}
</script>
>
