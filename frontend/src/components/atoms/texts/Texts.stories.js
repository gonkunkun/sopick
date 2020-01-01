import { storiesOf } from "@storybook/vue"
import TitleText from "./Title.vue"
import { text } from "@storybook/addon-knobs"

storiesOf("Text", module).add(
  "Title",
  () => {
    return {
      props: {
        text: {
          default: text("text", "タイトルテキスト")
        }
      },
      components: { TitleText },
      template: `<title-text :text="text" />`
    }
  },
  {
    info: {
      summary: "タイトルテキスト"
    }
  }
)
