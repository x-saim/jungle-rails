const { defineConfig } = require('cypress')

module.exports = defineConfig({
  // setupNodeEvents can be defined in either
  // the e2e or component configuration
  baseUrl: 'http://localhost:8000',
  viewportWidth: 1920,
  viewportHeight: 1080,

  e2e: {
    setupNodeEvents(on, config) {
      on('before:browser:launch', (browser = {}, launchOptions) => {
        /* ... */
      })
    },
  },
  screenshotsFolder: "tmp/cypress_screenshots",
  videosFolder: "tmp/cypress_videos",
  trashAssetsBeforeRuns: false
})
