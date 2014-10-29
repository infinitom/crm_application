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
	
	@@attribute_items = {
		"1" => "First Name",
		"2" => "Last Name`",
		"3" => "Email",
		"4" => "Notes",
		"5" => "Exit"
	}

	@@rolodex = Rolodex.new
	

	def menu_maker(items)
		items.each { |key, value| puts "[#{key}]\t#{value}"}
	end

	def start
		
		# Display menu and take input from user

		puts "Welcome to BitMaker Labs CRM\n============================"
		
		while true
			menu_maker(@@menu_items)

			print "Please select an option: "

			input = gets.chomp.to_i
			if input > 6
				puts "\nThank you for using the CRM!\n=============".green
				puts "| " + "Good bye!".red + " |\n============="
				return
			else
				menu_action(input)
			end
		end

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
			puts "Unrecognized command!".red
			puts "Please try again.".green
			return
		end
	end

	def crm_add
		puts "\nAdd a contact\n-------------".blue
		puts "Please enter a contact in the following comma separated format:"
		puts "John Doe, john@bitmakerlabs.com, He is an awesome guy".yellow
		
		input = gets.chomp.split(', ')
		
		contact = Contact.new(input) #create the contact object
		
		@@rolodex.add(contact) # add to the rolodex
		
	end
	
	def crm_display_all
		puts "\nDisplaying all Contacts\n-----------------------".blue
		lister(nil)
		# @rolodex.contacts.each do |contact|
  #     		puts "ID\tName\t\t\tEmail"
  #     		puts "#{contact.id}\t#{contact.first_name} #{contact.last_name}\t\t<#{contact.email}>"
		# end
	end


	def crm_display_one
		print "Enter an ID of a contact to view: "
		id = gets.chomp

		lister(id.to_i) if @@rolodex.contacts.to_s.include?(id)

	end
	
	def crm_modify
		puts "\nModify a contact\n-------------".blue
		puts "Please enter a contact in the following comma separated format:"
		
	end


	def crm_attrib
		#show ID, First Name, Last Name, Email or Notes
		
	end


	def crm_delete
		
	end

	def lister (id)
		puts "ID\tName\t\t\tEmail"
		puts "--\t----\t\t\t-----"
		if id == nil
			@@rolodex.contacts.each { |contact| puts "#{contact.id}\t#{contact.first_name} #{contact.last_name}\t\t<#{contact.email}>" }
		else
			@@rolodex.contacts.each do |contact|				
				puts "#{contact.id}\t#{contact.first_name} #{contact.last_name}\t\t<#{contact.email}>" if id == contact.id
			end
		end
		
	end

end


system 'clear'

crm = CRM.new

crm.start