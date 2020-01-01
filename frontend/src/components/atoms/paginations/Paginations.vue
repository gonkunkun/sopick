<template>
  <div class="text-center">
    <v-pagination
      v-model="currentPage"
      :length="totalPages"
    />
  </div>
</template>

<script>
export default {
  name: "Paginations",
  props: {
    currentPage: {
      type: Number,
      required: true,
      default: () => 1
    },
    totalPages: {
      type: Number,
      required: true,
      default: () => null
    }
  },
  data: () => ({}),
  computed: {},
  methods: {}
}
</script>

<style scoped></style>
