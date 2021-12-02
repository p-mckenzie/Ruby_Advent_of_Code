class Base
  @@year = 2020
  @@day = 1

  def get_data
    File.read(File.join(File.dirname(__FILE__), "../public/#{@@year}/day#{@@day}.txt"))
  end
end