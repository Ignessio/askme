import Rails from "@rails/ujs"
Rails.start()

import '../styles/application'
import '../scripts/form_toggle'

const images = require.context('../images', true)
