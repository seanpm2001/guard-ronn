require 'guard'
require 'guard/guard'
require 'ronn'

module Guard
  class Ronn < Guard
    require 'guard/ronn/runner'
    require 'guard/ronn/inspector'
    require 'guard/ronn/notifier'

    def initialize(watchers = [], options = {})
      super
      @options = options
    end

    # Call once when guard starts
    def start
      UI.info "Guard::Ronn is running, with Ronn #{::Ronn.version}!"
    end

    def run_all
      Runner.run(Inspector.ronn_files, @options.merge(:message => 'Building all manuals'))
    end

    def run_on_changes(paths)
      Runner.run(Inspector.clean(paths), @options)
    end

  end
end
