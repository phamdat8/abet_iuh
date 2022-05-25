class DocumentsController < ApplicationController
  before_action :check

  def check
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def index
    @docs = Document.search(params['search'], params['status']).paginate(:page => params[:page])
    @docs = @docs.where(status: 'approve') if current_user.role != 'manage'
    # byebug
  end

  def new
    @doc = Document.new
  end

  def create
    # byebug
    @doc = Document.new
    @doc.name = params['document']['name']
    @doc.file = params['document']['file']
    @doc.status = 'wait'
    @doc.save

    User.where(role: 'manage').each do |user|
      UserMailer.approve_doc(user, @doc, current_user, request.host_with_port).deliver_now
    end
    redirect_to documents_url
  end

  def approve
    Document.find(params[:id]).update(status: 'approve')
    redirect_to documents_url
  end

  def destroy
    Document.find(params['id']).destroy
    redirect_to documents_url
  end

  def view
    @doc = Document.find(params[:id])
  end
end