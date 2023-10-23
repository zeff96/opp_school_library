require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  menu = Menu.new(app)
  menu.menu_list
end

puts 'Welcome to school library app!!!'
main
