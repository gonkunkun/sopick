<template>
  <div class="pink lighten-3 ">
    <v-card-title class="pink--text text--lighten-5" v-text="actor.name" />
    <v-card-subtitle class="white--text">
      Age:{{ actor.age }} T:{{ actor.tall }} B:{{ actor.bust }}({{ actor.cup }})
      W:{{ actor.waist }} H:{{ actor.hip }}
      <a class="white--text" target="_blank" :href="actor.actor_page_url">{{
        actor.brothel.brothel_name
      }}</a>
    </v-card-subtitle>
  </div>
</template>

<script>
export default {
  name: "Profile",
  props: {
    actor: {
      type: Object,
      required: true
    }
  }
}
</script>
<style scoped>
a {
  text-decoration: none;
}
a:hover {
  text-decoration: none;
}
</style>
