require 'gas'
require 'yaml'
require 'fileutils'

module GasStats

  @config_file_path = File.join GAS_DIRECTORY, 'gas_stats.yaml'
  File.open(@config_file_path, 'w+') { |f| f.write('---') } unless File.exists? @config_file_path
  @config = YAML.load_file(@config_file_path)
  @config ||= {}

  def self.stats
    if @config
      puts 'Gas statistics:'
      [:add, :delete, :import, :list, :show, :use].each do |key|
        puts "   #{key.to_s}: #{(@config[key.to_s] ? @config[key.to_s] : 0)}"
      end
    else
      puts 'No statistics yet'
    end
  end

  def self.add
    update_key 'add'
  end

  def self.delete
    update_key 'delete'
  end

  def self.import
    update_key 'import'
  end

  def self.list
    update_key 'list'
  end

  def self.show
    update_key 'show'
  end

  def self.use
    update_key 'use'
  end

  private

  def self.save!
    File.open(@config_file_path, 'w+') do |f|
      f.write YAML::dump(@config)
    end
  end

  def self.update_key(key)
    if @config[key]
      @config[key] = @config[key].to_i + 1
    else
      @config[key] = 1
    end

    save!
  end

end