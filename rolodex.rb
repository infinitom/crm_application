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

end