<template>
  <v-img
    :src="src"
    class="white--text align-end"
    gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
    :height="height"
  >
    <v-card-title v-text="title" />
  </v-img>
</template>

<script>
export default {
  name: "AtomImage",

  props: {
    src: {
      type: String,
      required: true,
      default: () => null
    },
    title: {
      type: String,
      required: true,
      default: () => null
    },
    height: {
      type: Number,
      required: false,
      default: () => 300
    }
  }
}
</script>
