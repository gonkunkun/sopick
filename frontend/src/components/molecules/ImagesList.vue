<template>
  <v-card>
    <v-container fluid>
      <v-row>
        <v-col
          v-for="(item, i) in actorImages"
          :key="i"
          class="d-flex child-flex"
          xs="3"
          sm="2"
          md="1"
        >
          <v-card flat tile class="d-flex" @click="changeImage(i)">
            <atom-image :actor-image="item.image_path" />
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
import AtomImage from "@/components/atoms/images/Image"

export default {
  name: "ImagesList",
  components: {
    AtomImage
  },
  props: {
    actorImages: {
      type: Array,
      required: true,
      default: () => null
    }
  },
  methods: {
    changeImage: function(newVal) {
      this.$emit("update", newVal)
    }
  }
}
</script>

<style scoped></style>
