class Admin::PiController < Admin::HomeController
  before_action :init
  def new
  end

  def create
    data = {
      so_id: @so.id,
      content: params[:content]
    }
    @pi = Pi.new(data)
    if @pi.save
      flash.alert = I18n.t('pi.created')
      redirect_to admin_so_path(@so)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def show
    @pi_lo = PiLo.where(pi_id: params[:id])
    
  end

  def destroy
    @pi.destroy
    redirect_to admin_so_url(@so)
  end

  def init
    @so = So.find(params[:so_id])
    @pi = Pi.find(params[:id]) if params[:id]
    @pi = @pi || Pi.new
  end
end