<template>
  <v-btn icon :href="url" target="_blank">
    <v-icon :color="color">
      {{ icon }}
    </v-icon>
  </v-btn>
</template>

<script>
export default {
  name: "VuetifyIcon",
  props: {
    icon: {
      type: String,
      required: true,
      default: () => null
    },
    color: {
      type: String,
      required: false,
      default: () => ""
    },
    url: {
      type: String,
      required: false,
      default: () => ""
    }
  }
}
</script>
