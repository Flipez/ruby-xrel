module Xrel
  autoload :Client, 'xrel/client'
  autoload :Error, 'xrel/error'
  autoload :VERSION, 'xrel/version'

  module Release
    autoload :Info, 'xrel/release/info'
  end
end
