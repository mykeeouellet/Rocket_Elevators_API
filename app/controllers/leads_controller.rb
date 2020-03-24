class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
    lead = Lead.new

          lead.lead_full_name = params[:Name]
          lead.lead_company_name = params[:Business_name]
          lead.lead_email = params[:Email]
          lead.lead_phone = params[:Phone]
          lead.project_name = params[:Project_name]
          lead.project_description = params[:Subject]
          lead.department_of_service = params[:Department]
          lead.lead_message = params[:Message]
          lead.created_at = Time.now

      lead.save!
      redirect_to "/pages/index_one_page_elevator"
    end
  end
