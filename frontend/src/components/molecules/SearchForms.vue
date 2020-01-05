<template>
  <v-row>
    <select-chips
      label="業種"
      :items="typeItems"
      :values="typeValue"
      @updated="updated"
    />
    <select-chips
      label="都道府県"
      :items="prefItems"
      :values="prefValue"
      @updated="updated"
    />
  </v-row>
</template>

<script>
import SelectChips from "@/components/atoms/selects/SelectChips"

export default {
  name: "SearchForms",
  components: {
    SelectChips
  },
  props: {
    typeItems: {
      type: Array,
      required: true
    },
    typeValue: {
      type: Array,
      required: true
    },
    prefItems: {
      type: Array,
      required: true
    },
    prefValue: {
      type: Array,
      required: true
    }
  },
  data: function() {
    return {}
  },
  methods: {
    updated: function(event, label) {
      this.$emit("updated", event, label)
    }
  }
}
</script>
<style scoped></style>
