#
# CRM Application
# This is the Contacts class file
# Part of the CRM application called by crm.rb
#

class Contact
	attr_accessor :first_name, :last_name, :email, :notes

	def initialize(incoming)
		name = incoming[0].split(' ') #split the full name using the space
		
		@first_name = name[0] #name's first array element
		@last_name = name[1] #name's last array element
		@email = incoming[1] #incoming's middle element
		@notes = incoming[2] #incoming's last element	
	end

end