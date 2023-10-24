require 'json'

class DataManager
  def initialize(filename)
    @filename = filename
  end

  def save_to_json(data)
    File.write(@filename, JSON.generate(data))
  end
end
