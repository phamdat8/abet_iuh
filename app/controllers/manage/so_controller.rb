class Manage::SoController < HomesController
  def index
    @so = So.all
  end

  def new
    @so = So.new
  end

  def show
    @so = So.find(params[:id])
    @pi = Pi.where(so_id: params[:id])
  end

  def create
    data = {
      name: params[:name],
      content: params[:content],
      semester_id: params[:semester]
    }
    @so = So.new(data)
    if @so.save
      flash.alert = I18n.t('so.created')
      @so = So.all
      render :index
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def destroy
    So.find(params[:id]).destroy
    @so = So.all
    redirect_to manage_so_index_url
  end
end
