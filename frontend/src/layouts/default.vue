<template>
  <v-app>
    <TheHeader />
    <v-content>
      <nuxt />
    </v-content>
  </v-app>
</template>

<script>
import TheHeader from "~/components/TheHeader.vue"
export default {
  components: {
    TheHeader
  }
}
</script>
