import { storiesOf } from "@storybook/vue"
import VuetifyIcon from "./VuetifyIcon.vue"
import { text } from "@storybook/addon-knobs"

// TODO: CFS記法に移行する
// export default {
//   title: "Icon",
// }

// export const VuetifyIconType = () => ({
//   components: { VuetifyIcon },
//   props: {
//     icon: {
//       default: String("mdi-bookmark", "mdi-bookmark")
//     },
//     color: {
//       default: String("pink", "pink")
//     }
//   },
//   template: `<vuetify-icon :icon="icon" :color="color" />`,
//   info: {
//     summary: "test"
//   }
// })

storiesOf("Icons", module).add(
  "VuetifyIcon",
  () => {
    const icon = text("icon", "mdi-bookmark")
    const color = text("color", "pink")
    return {
      components: { VuetifyIcon },
      template: `<vuetify-icon icon="${icon}" color="${color}" />`
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているアイコン"
    }
  }
)
