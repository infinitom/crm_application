#
# CRM Application
# This is the CRM class file
# Requires  rolodex.rb, contact.rb
#

require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	def initialize
		
	end
	def to_s
		"Welcome to BitMaker Labs CRM\n============================"
	end
end


system 'clear'

crm = CRM.new
puts crm