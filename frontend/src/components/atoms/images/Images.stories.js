import { storiesOf } from "@storybook/vue"
import AtomImage from "./Image.vue"
import { text, number, array } from "@storybook/addon-knobs"

storiesOf("Images", module).add(
  "Image",
  () => {
    const imagePath = array("imagePath", [{
      image_path: "https://www.pakutaso.com/shared/img/thumb/KAZ76_nemof01_TP_V.jpg"
    }])
    const name = text("name", "Test")
    const age = text("age", 25)
    const tall = text("tall", 160)
    const bust = text("bust", 80)
    const cup = text("cup", "C")
    const waist = text("waist", 60)
    const hip = text("hip", 60)
    const height = number("height", 300)
    return {
      components: { AtomImage },
      template: `
        <atom-image
          src="${imagePath[0].image_path}"
          name="${name}"
          age="${age}"
          tall="${tall}"
          bust="${bust}"
          cup="${cup}"
          waist="${waist}"
          hip="${hip}"
          height="${height}"
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
