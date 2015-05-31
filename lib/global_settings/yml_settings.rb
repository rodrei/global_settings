module GlobalSettings

  class YMLSettings
    def self.get(options)
      new(options).to_hash
    end

    def initialize(options)
      @root_path = options[:root_path] ||
                     guess_root_path ||
                     raise(ArgumentError.new("root_path must be specified"))

      @environment = options[:environment] ||
                       guess_environment ||
                       raise(ArgumentError.new("environment must be specified"))
    end

    def to_hash
      hash = YAML.load_file(yml_settings_path)
      hash ? hash.deep_symbolize_keys! : {}
     rescue Errno::ENOENT
       puts "Could not load settings from settings.yml file for #{@environment} environment"
       {}
    end

    private

    def yml_settings_path
      File.join(@root_path, 'config', 'settings', "#{@environment}.yml")
    end

    def guess_root_path
      case
        when defined? Rails
          Rails.root
        when defined? Sinatra::Application
          Sinatra::Application.root
      end
    end

    def guess_environment
      case
        when defined? Rails
          Rails.env
        when defined? Sinatra::Application
          Sinatra::Application.environment
        else
          ENV['RACK_ENV']
      end
    end
  end

end
