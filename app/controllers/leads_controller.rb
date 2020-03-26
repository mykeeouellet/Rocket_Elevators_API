class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token
    require 'sendgrid-ruby'
    include SendGrid
    
    def create
    lead = Lead.new
    puts "****************************************"
    puts params[:Attachment]
    puts "****************************************"
    
          lead.lead_full_name = params[:Name]
          lead.lead_company_name = params[:Business_name]
          lead.lead_email = params[:Email]
          lead.lead_phone = params[:Phone]
          lead.project_name = params[:Project_name]
          lead.project_description = params[:Subject]
          lead.department_of_service = params[:Department]
          lead.lead_message = params[:Message]
          lead.created_at = Time.now
          lead.attachment = params[:Attachment]
      lead.save!
  
          # SendGrid 
          data = {
            personalizations: [
              {
                to: [
                  {
                    email: lead.lead_email
                  }
                ],
                dynamic_template_data: {
                    subject: "Confirmation Contact Request ",
                    FullName: lead.lead_full_name,
                    ProjectName: lead.project_name
                },
              }
            ],
            from: {
              email: "rocketelevator@gmail.com"
            },
            template_id: "d-c9c93ed00b254f0293e8832621031ffa"
          }
          puts "********************************************"
          sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
          puts sg
          puts "********************************************"
          response = sg.client.mail._("send").post(request_body: data)
          puts response.as_json
          puts "********************************************"


          redirect_to "/pages/index_one_page_elevator"
         
    end


end