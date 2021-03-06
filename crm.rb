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
		"1" => "ID",
		"2" => "First Name",
		"3" => "Last Name",
		"4" => "Email",
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
			puts "\n"
			menu_maker(@@menu_items)

			print "\nPlease select an option: "

			input = gets.chomp.to_i
			if input > 6
				puts "\nThank you for using the CRM!\n=============".green
				puts "| " + "Good bye!".red + " |\n============="
				return
			else
				main_menu(input)
			end
		end

	end

	def main_menu(user_input)
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

	def attrib_menu(user_input, action)
		
		if action == "modify"
			case user_input
				when 1
					print "Enter Old ID: "
					old_id = gets.chomp.to_i
					print "Enter New ID: "	
					new_id = gets.chomp.to_i
					@@rolodex.modify("ID", old_id, new_id)
				when 2
					print "Enter Old First Name: "
					old_fname = gets.chomp
					print "Enter New First Name: "	
					new_fname = gets.chomp
					@@rolodex.modify("First Name", old_fname, new_fname)
				when 3
					print "Enter Old Last Name: "
					old_lname = gets.chomp
					print "Enter New Last Name: "	
					new_lname = gets.chomp
					@@rolodex.modify("Last Name", old_lname, new_lname)
				when 4
					print "Enter Old Email: "
					old_email = gets.chomp
					print "Enter New Email: "	
					new_email = gets.chomp
					@@rolodex.modify("Email", old_email, new_email)
				else
					puts "Unrecognized command!".red
					puts "Please try again.".green
					return
			end

		elsif action == "delete"
			case user_input
				when 1
					print "By ID: "
					by_id = gets.chomp.to_i
					@@rolodex.delete("ID", by_id)
				when 2
					print "By First Name: "
					by_fname = gets.chomp
					@@rolodex.delete("First Name", by_fname)
				when 3
					print "By Last Name: "
					by_lname = gets.chomp
					@@rolodex.delete("Last Name", by_lname)
				when 4
					print "By Email: "
					by_email = gets.chomp
					@@rolodex.delete("Email", by_email)
				else
					puts "Unrecognized command!".red
					puts "Please try again.".green
					return
			end
		else
			case user_input
				when 1 then lister(nil,"ID")
				when 2 then lister(nil,"First Name")
				when 3 then lister(nil,"Last Name")
				when 4 then lister(nil,"Email")				
				else
					puts "Unrecognized command!".red
					puts "Please try again.".green
					return
			end

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
		puts "\nDisplaying all Contacts & Attributes\n-----------------------".blue
		lister(nil,"all")
		# @rolodex.contacts.each do |contact|
  #     		puts "ID\tName\t\t\tEmail"
  #     		puts "#{contact.id}\t#{contact.first_name} #{contact.last_name}\t\t<#{contact.email}>"
		# end
	end


	def crm_display_one
		print "Enter an ID of a contact to view: "
		id = gets.chomp

		lister(id.to_i,"all") if @@rolodex.contacts.to_s.include?(id)

	end
	

	def crm_attrib
		#show ID, First Name, Last Name, Email or Notes

		while true
			puts "\n"
			menu_maker(@@attribute_items)

			print "\nPlease select an option: "

			input = gets.chomp.to_i
			if input > 4
				puts "\nReturning to main menu!\n".green
				return
			else
				attrib_menu(input, "list")
			end
		end

		
	end
	
	def crm_modify
		puts "\nModify\n-------------".blue
		puts "Please select an attribute to modify by:"
		while true
			puts "\n"
			menu_maker(@@attribute_items)

			print "\nPlease select an option: "

			input = gets.chomp.to_i
			if input > 4
				puts "\nReturning to main menu!\n".green
				return
			else
				attrib_menu(input, "modify")
			end
		end
	end

	def crm_delete
		puts "\nDelete\n-------------".blue
		puts "Please select an attribute to delete by:"
		
		while true
			puts "\n"
			menu_maker(@@attribute_items)

			print "\nPlease select an option: "

			input = gets.chomp.to_i
			if input > 4
				puts "\nReturning to main menu!\n".green
				return
			else
				attrib_menu(input, "delete")
			end
		end
		
	end

	def lister (id, attribute)

		if id == nil
			@@rolodex.contacts.each do |contact|
			 	case attribute
			 	when "ID" then puts "#{contact.id}"
			 	when "First Name" then puts "#{contact.first_name}"
			 	when "Last Name" then puts "#{contact.last_name}"
			 	when "Email" then puts "#{contact.email}"
			 	when "Notes" then puts "#{contact.notes}"
			 	else
			 		puts "#{contact.id}\t#{contact.first_name} #{contact.last_name}\t\t<#{contact.email}>" 
			 	end			 	
			end
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