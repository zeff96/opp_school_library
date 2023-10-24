require 'json'

class DataManager
  def initialize(filename)
    @filename = filename
  end

  def save_to_json(data)
    File.write(@filename, JSON.generate(data))
  end

  def load_from_json
    return [] unless File.exist?(@filename)

    File.open(@filename, 'r') do |file|
      JSON.parse(file.read, symbolize_names: true)
    end
  end
end
