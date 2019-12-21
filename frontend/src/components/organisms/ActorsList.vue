<template>
  <v-container fluid>
    <div class="title py-1">
      キャスト一覧
    </div>
    <v-row>
      <v-col v-for="actor in actors" :key="actor.name" :cols="flex" :md="md">
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
  props: {
    actors: {
      type: Array,
      required: true,
      default: () => null
    }
  },
  data: () => ({
    height: 300,
    flex: 12,
    md: 3
    // actors: [
    //   {
    //     name: "コハク",
    //     image_path:
    //       ["https://img.cityheaven.net/img/girls/tt/club-max/grdr0022463635_0332904101pc.jpg"],
    //     tall: 158,
    //     bust: 86,
    //     cup: "C",
    //     waist: 57,
    //     hip: 86,
    //     flex: 12,
    //     md: 3
    //   },
    //   {
    //     name: "Misono",
    //     image_path:
    //      ["https://img.cityheaven.net/img/girls/tt/otome/grdr0025655665_0325033145pc.jpg"],
    //     tall: 158,
    //     bust: 86,
    //     cup: "C",
    //     waist: 57,
    //     hip: 86,
    //     flex: 12,
    //     md: 3
    //   },
    //   {
    //     name: "ほげほげ",
    //     image_path:
    //       ["https://img.cityheaven.net/img/girls/tt/otome/grdr0020413179_0317853460pc.jpg"],
    //     tall: 158,
    //     bust: 86,
    //     cup: "C",
    //     waist: 57,
    //     hip: 86,
    //     flex: 12,
    //     md: 3
    //   },
    //   {
    //     name: "鈴村あいり",
    //     image_path:
    //       ["https://static-assets.7msport.com/newsattached/1908/6633/a9548d9972517bdaf7559f5442d2d070.jpg"],
    //     tall: 158,
    //     bust: 86,
    //     cup: "C",
    //     waist: 57,
    //     hip: 86,
    //     flex: 12,
    //     md: 3
    //   },
    //   {
    //     name: "河南実里",
    //     image_path:
    //       ["https://pbs.twimg.com/profile_images/1118850760865800192/UQxsFhD9_400x400.jpg"],
    //     tall: 158,
    //     bust: 86,
    //     cup: "C",
    //     waist: 57,
    //     hip: 86,
    //     flex: 12,
    //     md: 3
    //   },
    //   {
    //     name: "希志あいの",
    //     image_path: ["http://nicovideo.cdn.nimg.jp/thumbnails/29723744/29723744.L"],
    //     tall: 158,
    //     bust: 86,
    //     cup: "C",
    //     waist: 57,
    //     hip: 86,
    //     flex: 12,
    //     md: 3
    //   }
    // ]
  })
}
</script>
