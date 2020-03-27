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
    #     @client = DropboxApi::Client.new('VFvZpSOiO-AAAAAAAAAAcnn-zgsEqc9jj71YoQVD2n-aqUoGc2kmTLct-7lYi10X')  
    #     #read from dropbox
    #     result = @client.list_folder "/1st folder"
    # end

    # def upload_to_dropbox
    #     @client = DropboxApi::Client.new('VFvZpSOiO-AAAAAAAAAAcnn-zgsEqc9jj71YoQVD2n-aqUoGc2kmTLct-7lYi10X')  
    #     file = self.attachment

    #     file = @client.upload("/#{file}", file_content)
    
    # end

  
  
   
  
  end