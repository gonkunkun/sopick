<template>
  <v-img
    :src="actorImage"
    class="white--text align-end"
    :gradient="imageGradient"
    :height="height"
    @mouseenter="MouseOverImage"
    @mouseleave="MouseLeaveImage"
  />
</template>

<script>
export default {
  name: "AtomImage",
  props: {
    actorImage: {
      type: String,
      required: true,
      default: () => "/cosmos.jpg"
    },
    height: {
      type: Number,
      required: false,
      default: () => 80
    }
  },
  data: () => ({
    imageGradient: "to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
  }),
  methods: {
    MouseOverImage: function() {
      this.imageGradient = "to bottom, rgba(0,0,0,.0), rgba(0,0,0,.2)"
    },
    MouseLeaveImage: function() {
      this.imageGradient = "to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
    }
  }
}
</script>

<style scoped>
.v-card {
  transition: opacity 0.4s ease-in-out;
}
.v-card:not(.on-hover) {
  opacity: 0.6;
}
.show-btns {
  color: rgba(255, 255, 255, 1) !important;
}
a {
  text-decoration: none;
}
a:hover {
  text-decoration: none;
}
</style>
