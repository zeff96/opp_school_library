require 'json'
require 'fileutils'

class DataManager
  def initialize(data_directory)
    @data_directory = data_directory
  end

  def save_to_json(data, filename)
    create_directory_if_not_exits

    File.write(File.join(@data_directory, filename), JSON.generate(data))
  end

  def load_from_json(filename, default_value)
    file_path = File.join(@data_directory, filename)
    return default_value unless File.exist?(file_path)

    File.open(@filename, 'r') do |file|
      JSON.parse(file.read, symbolize_names: true)
    end
  end

  private

  def create_directory_if_not_exits
    FileUtils.mkdir_p(@data_directory) unless File.directory?(@data_directory)
  end
end
