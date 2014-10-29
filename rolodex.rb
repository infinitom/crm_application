#
# CRM Application
# This is the Rolodex class file
# Part of the CRM application called by crm.rb
#

class Rolodex
	attr_accessor :contacts
	
	@@index = 1000

	def initialize
		@contacts = []
	end

	def add(contact)
		contact.id = @@index
    	@@index += 1
		@contacts << contact
	end

	def modify(by_attrib, old_info, new_info)
		@contacts.each do |contact|
			case by_attrib
				when "ID"
					contact.id = new_info if contact.id == old_info
				when "First Name"
					contact.first_name = new_info if contact.first_name == old_info
				when "Last Name"
					contact.last_name = new_info if contact.last_name == old_info
				when "Email"
					contact.email = new_info if contact.email == old_info
			end
		end
	end

	def delete(by_attrib, criteria)
			@contacts.each do |contact|
			case by_attrib
				when "ID"
					@contacts.delete (contact) if contact.id == criteria
				when "First Name"
					 @contacts.delete (contact) if contact.first_name == criteria
				when "Last Name"
					@contacts.delete (contact) if contact.last_name == criteria
				when "Email"
					@contacts.delete (contact) if contact.email == criteria
			end
		end
	end


end