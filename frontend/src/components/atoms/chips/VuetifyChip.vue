<template>
  <v-chip class="ma-1" :color="color" :url="url" target="_blank" small outlined>
    {{ brothelType }}
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
    url: {
      type: String,
      required: false,
      default: () => ""
    },
    brothelType: {
      type: String,
      required: false,
      default: () => "未設定"
    }
  }
}
</script>
