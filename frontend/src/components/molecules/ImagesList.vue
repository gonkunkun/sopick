<template>
  <v-row>
    <v-col>
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
              <v-card flat tile class="d-flex">
                <atom-image :actor-image="item.image_path" />
              </v-card>
            </v-col>
          </v-row>
        </v-container>
      </v-card>
    </v-col>
  </v-row>
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
  methods: {}
}
</script>

<style scoped></style>
