class DocumentsController < ApplicationController
  def index
    @docs = Document.search(params['search']).paginate(:page => params[:page])
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
    @doc.save
    redirect_to documents_url
  end
end