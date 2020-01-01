<template>
  <div class="text-center">
    <v-pagination
      v-model="current"
      :length="totalPages"
      :total-visible="totalVisible"
      @input="inputMethod"
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
      default: 1
    },
    totalPages: {
      type: Number,
      required: true,
      default: 0
    },
    totalVisible: {
      type: Number,
      required: false,
      default: () => 9
    },
    inputMethod: {
      type: Function,
      required: false,
      default: () => null
    }
  },
  data: function() {
    return {
      current: this.currentPage
    }
  },
  computed: {},
  methods: {}
}
</script>

<style scoped></style>
