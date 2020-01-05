<template>
  <v-col cols="12" sm="6" md="6">
    <v-select
      v-model="selectValue"
      :items="selectItems"
      :label="label"
      attach
      chips
      multiple
      @input="updateValue"
    />
  </v-col>
</template>

<script>
export default {
  name: "SelectChips",
  props: {
    label: {
      type: String,
      required: true
    },
    items: {
      type: Array,
      required: true
    },
    values: {
      type: Array,
      required: true
    }
  },
  data: function() {
    return {
      selectItems: this.items,
      selectValue: this.values
    }
  },
  methods: {
    updateValue: function(event) {
      console.log(event)
      this.$emit("updated", event, this.label)
    }
  }
}
</script>
<style scoped></style>
