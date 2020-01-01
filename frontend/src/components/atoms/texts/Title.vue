<template>
  <div class="title py-1">
    {{ text }}
  </div>
</template>

<script>
export default {
  name: "Title",
  props: {
    text: {
      type: String,
      required: true
    }
  }
}
</script>
