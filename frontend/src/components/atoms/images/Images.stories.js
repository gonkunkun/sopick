import { storiesOf } from "@storybook/vue"
import AtomImage from "./Image.vue"
import AtomImagesGarary from "./ImagesGarary.vue"
import { text, number, array } from "@storybook/addon-knobs"

storiesOf("Images", module).add(
  "Image",
  () => {
    return {
      props: {
        actorImage: {
          default: text("actorImage", "https://www.pakutaso.com/shared/img/thumb/KAZ76_nemof01_TP_V.jpg")
        },
        name: {
          default: text("name", "Test")
        },
        age: {
          default: number("age", 25)
        },
        tall: {
          default: number("tall", 160)
        },
        bust: {
          default: number("bust", 80)
        },
        cup: {
          default: text("cup", "C")
        },
        waist: {
          default: number("waist", 60)
        },
        hip: {
          default: number("hip", 60)
        },
        height: {
          default: number("height", 300)
        }
      },
      components: { AtomImage },
      template: `
        <atom-image
          :actor-image="actorImage"
          :name="name"
          :age="age"
          :tall="tall"
          :bust="bust"
          :cup="cup"
          :waist="waist"
          :hip="hip"
          :height="height"
        />
      `
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているアイコン"
    }
  }
)

storiesOf("Images", module).add(
  "ImagesGarary",
  () => {
    return {
      props: {
        name: {
          default: text("name", "Test")
        },
        age: {
          default: number("age", 25)
        },
        tall: {
          default: number("tall", 160)
        },
        bust: {
          default: number("bust", 80)
        },
        cup: {
          default: text("cup", "C")
        },
        waist: {
          default: number("waist", 60)
        },
        hip: {
          default: number("hip", 60)
        },
        height: {
          default: number("height", 300)
        },
        actorImages: {
          default: array("actorImage", 
          [
            { image_path: "https://www.pakutaso.com/shared/img/thumb/KAZ76_nemof01_TP_V.jpg " },
            { image_path: "http://画像まとめ.com/wp-content/uploads/2016/06/%E3%83%AF%E3%83%B3%E3%82%B3%E3%82%92%E6%8E%A2%E3%81%99%E7%94%BB%E5%83%8F16.jpg" }
          ])
        }
      },
      components: { AtomImagesGarary },
      template: `
        <atom-images-garary
          :actor-images="actorImages"
          :name="name"
          :age="age"
          :tall="tall"
          :bust="bust"
          :cup="cup"
          :waist="waist"
          :hip="hip"
          :height="height"
        />
      `
    }
  },
  {
    info: {
      summary: "画像リストを自動的に切り替える"
    }
  }
)
