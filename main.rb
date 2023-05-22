require_relative 'app'
require_relative 'console'

def main
  app = App.new
  menu = Menu.new(app)
  menu.menu_list
end

puts 'Welcome to school library app!!!'
main
