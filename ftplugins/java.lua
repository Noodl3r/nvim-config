local jdtls = require('jdtls')

local home = os.getenv("HOME")

local workspace_dir = home .. "/.cache/jdtls/" ..
  vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = {
    "jdtls",
  },

  root_dir = require('jdtls.setup').find_root({
    '.git',
    'mvnw',
    'gradlew',
    'build.gradle',
    'pom.xml'
  }),

  workspace_folder = workspace_dir,

  settings = {
    java = {}
  },

  init_options = {
    bundles = {}
  }
}

jdtls.start_or_attach(config)
