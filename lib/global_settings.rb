require "active_support/core_ext/hash"
require "tender_hash"
require "global_settings/version"
require "global_settings/yml_settings"

module GlobalSettings
  @settings = {}

  class << self

    def load!(env, options={}, &block)
      raise ArgumentError.new("Expected block with TenderHash mapping") unless block_given?
      @mapping = block
      @options = options
      load_env_settings(env)
      load_yml_settings
    end

    def reload!(env)
      reset!
      load_env_settings(env)
      load_yml_settings
    end

    def reset!
      @settings = {}
    end

    def [](key)
      @settings[key]
    end

    private

    def load_env_settings(env)
      @settings.deep_merge!(
        TenderHash.map(env, &@mapping)
      )
    end

    def load_yml_settings
      @settings.deep_merge!(YMLSettings.get(@options))
    end

  end

end

Settings = GlobalSettings unless defined?(Settings)
