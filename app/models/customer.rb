class Customer < ApplicationRecord
    belongs_to :user
    has_many :addresses , as: :entity
    has_many :building
    has_many :quote

    # client = DropboxApi::Client.new('token')

#       # After save on a customer, verify if there is a lead (for dropbox)
#   def verify_lead
#     puts "in verify lead"
#     # verify if there is 1 lead
#     if self.lead
#       puts "OK____________THERE IS 1 LEAD__________________"      

#         # if the lead has no attachment, print to console
#         if self.lead.file_attachment == nil
#           puts "__________There's no attachment in the lead_____________"
#         else 
#           self.lead.add_file_to_dropbox
#         end        
#     else
#       puts "OK____________THERE IS NO LEAD__________________"
#     end 

#   end






end
