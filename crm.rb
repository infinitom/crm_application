#
# CRM Application
# This is the CRM class file
# Requires  rolodex.rb, contact.rb
#

require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	
	@@menu_items = {
		"1" => "Add a contact",
		"2" => "Modify a contact",
		"3" => "Display all contacts",
		"4" => "Display a contact",
		"5" => "Display an attribute",
		"6" => "Delete a contact",
		"7" => "Exit"
	}

	def menu_maker
		@@menu_items.each { |key, value| puts "[#{key}]\t#{value}"}
	end


	def start
		puts "Welcome to BitMaker Labs CRM\n============================"
		menu_maker
	end
end


system 'clear'

crm = CRM.new

crm.start