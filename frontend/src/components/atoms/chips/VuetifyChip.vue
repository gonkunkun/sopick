<template>
  <v-chip
    class="ma-1"
    :color="color"
    :href="href"
    target="_blank"
    small
    outlined
  >
    デリヘル
  </v-chip>
</template>

<script>
export default {
  name: "VuetifyChip",
  props: {
    color: {
      type: String,
      required: false,
      default: () => "pink"
    },
    href: {
      type: String,
      required: false,
      default: () => ""
    }
  }
}
</script>
