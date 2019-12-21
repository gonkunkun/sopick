<template>
  <v-img
    :src="actorImages[0].image_path"
    class="white--text align-end"
    :gradient="imageGradient"
    :height="height"
    @mouseenter="MouseOverImage"
    @mouseleave="MouseLeaveImage"
  >
    <v-card-title class="pink--text text--lighten-5" v-text="name" />
    <v-card-subtitle class="white--text">
      Age:{{ age }} T:{{ tall }} B:{{ bust }}({{ cup }}) W:{{ waist }} H:{{
        hip
      }}
    </v-card-subtitle>
  </v-img>
</template>

<script>
export default {
  name: "AtomImage",
  props: {
    actor: {
      type: Object,
      required: true,
      default: () => null
    },
    actorImages: {
      type: Array,
      required: true,
      default: () => [
        {
          image_path: "/cosmos.jpg"
        }
      ]
    },
    name: {
      type: String,
      required: true,
      default: () => "名無し"
    },
    age: {
      type: Number,
      required: false,
      default: () => 0
    },
    tall: {
      type: Number,
      required: false,
      default: () => 0
    },
    bust: {
      type: Number,
      required: false,
      default: () => 0
    },
    cup: {
      type: String,
      required: false,
      default: () => ""
    },
    waist: {
      type: Number,
      required: false,
      default: () => 0
    },
    hip: {
      type: Number,
      required: false,
      default: () => 0
    },
    height: {
      type: Number,
      required: false,
      default: () => 300
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
</style>
