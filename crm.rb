#
# CRM Application
# This is the CRM class file
# Requires  rolodex.rb, contact.rb
#

require_relative './contact.rb'
require_relative './rolodex.rb'

#For fancy colours n stuff
require 'colorize'


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
		
		# Display menu and take input from user

		puts "Welcome to BitMaker Labs CRM\n============================"
		
		menu_maker
		
		print "Please select an option: "
		
		input = gets.chomp.to_i

		menu_action(input)

	end

	def menu_action(user_input)
		case user_input
		when 1 then crm_add
		when 2 then crm_modify
		when 3 then crm_display_all
		when 4 then crm_display_one
		when 5 then crm_attrib
		when 6 then crm_delete
		else
			puts "\nThank you for using the CRM!\n=============\n| Good bye! |\n============="
			return
		end
	end

	def crm_add
		puts "\nAdd a contact\n-------------".blue
		puts "Please enter a contact in the following comma separated format:"
		puts "John Doe, john@bitmakerlabs.com, He is an awesome guy".yellow
		
		input = gets.chomp.split(', ')
		
		contact = Contact.new(input)
		
	end

	def crm_modify
		
	end

	def crm_display_all
		
	end

	def crm_display_one
		
	end

	def crm_attrib
		
	end

	def crm_delete
		
	end
end


system 'clear'

crm = CRM.new

crm.start