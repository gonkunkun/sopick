<template>
  <v-container fluid>
    <v-row>
      <v-col
        v-for="actor in actors"
        :key="actor.name"
        :cols="actor.flex"
        :md="actor.md"
      >
        <actor-card :actor="actor" :height="height" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import ActorCard from "@/components/molecules/ActorCard"

export default {
  name: "ActorList",
  components: {
    ActorCard
  },
  data: () => ({
    height: 300,
    actors: [
      {
        name: "コハク",
        src:
          "https://img.cityheaven.net/img/girls/tt/club-max/grdr0022463635_0332904101pc.jpg",
        tall: 158,
        bust: 86,
        cup: "C",
        waist: 57,
        hip: 86,
        flex: 12,
        md: 4
      },
      {
        name: "Misono",
        src:
          "https://img.cityheaven.net/img/girls/tt/otome/grdr0025655665_0325033145pc.jpg",
        tall: 158,
        bust: 86,
        cup: "C",
        waist: 57,
        hip: 86,
        flex: 12,
        md: 4
      },
      {
        name: "ほげほげ",
        src:
          "https://img.cityheaven.net/img/girls/tt/otome/grdr0020413179_0317853460pc.jpg",
        tall: 158,
        bust: 86,
        cup: "C",
        waist: 57,
        hip: 86,
        flex: 12,
        md: 4
      },
      {
        name: "鈴村あいり",
        src:
          "https://static-assets.7msport.com/newsattached/1908/6633/a9548d9972517bdaf7559f5442d2d070.jpg",
        tall: 158,
        bust: 86,
        cup: "C",
        waist: 57,
        hip: 86,
        flex: 12,
        md: 4
      },
      {
        name: "河南実里",
        src:
          "https://pbs.twimg.com/profile_images/1118850760865800192/UQxsFhD9_400x400.jpg",
        tall: 158,
        bust: 86,
        cup: "C",
        waist: 57,
        hip: 86,
        flex: 12,
        md: 4
      },
      {
        name: "希志あいの",
        src: "http://nicovideo.cdn.nimg.jp/thumbnails/29723744/29723744.L",
        tall: 158,
        bust: 86,
        cup: "C",
        waist: 57,
        hip: 86,
        flex: 12,
        md: 4
      }
    ]
  })
}
</script>
