import { storiesOf } from "@storybook/vue"
import TitleText from "./Title.vue"
import Profile from "./Profile.vue"
import { text, object } from "@storybook/addon-knobs"

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

storiesOf("Text", module).add(
  "Profile",
  () => {
    return {
      props: {
        actor: {
          default: object("actor", {
            name: "明日花",
            age: "25",
            tall: "160",
            bust: "80",
            cup: "C",
            waist: "60",
            hip: "70",
            actor_page_url: "http://google.com",
            brothel: {
              brothel_name: "テスト店舗"
            }
          })
        }
      },
      components: { Profile },
      template: `<Profile :actor="actor" />`
    }
  },
  {
    info: {
      summary: "タイトルテキスト"
    }
  }
)
