<template>
  <v-btn icon>
    <v-icon :color="color">{{ icon }}</v-icon>
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
    }
  }
}
</script>
