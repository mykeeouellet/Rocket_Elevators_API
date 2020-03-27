class Lead < ApplicationRecord

    has_one_attached :Attachment

    
    # IBM Watson
    # You currently have XXX leads in your contact requests
    # nb_leads = Lead.all
    # request.body = JSON.dump({
    #   "text" => "You currently have #{nb_leads} leads in your contact requests"})

    # def test_dropbox

    # end


    # def test
    #     @client = DropboxApi::Client.new('')  
    #     #read from dropbox
    #     result = @client.list_folder "/1st folder"
    # end

    # def upload_to_dropbox
    #     @client = DropboxApi::Client.new('')  
    #     file = self.attachment

    #     file = @client.upload("/#{file}", file_content)
    
    # end
end
