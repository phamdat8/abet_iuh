class Admin::PiLoController < Admin::HomeController
  before_action :init
  def new
  end

  def create
    data = {
      priority: params['priority'],
      pi_id: params['pi_id'],
      learning_outcome_id: params['lo_id'],
      process: params['process']

    }
    @pi_lo = PiLo.new(data)
    if @pi_lo.save
      flash.alert = I18n.t('pi_lo.created')
      redirect_to admin_so_pi_path(@so, @pi)
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def destroy
    @pi_lo.destroy
    redirect_to admin_so_pi_path(@so, @pi)
  end

  def init
    @so = So.find(params[:so_id])
    @pi = Pi.find(params[:pi_id]) if params[:pi_id]
    @pi_lo = ::PiLo.find(params[:id]) if params[:id]
    @pi_lo = @pi_lo || PiLo.new
    @pri_list = [
      {name: 'I', id: 'I'},
      {name: 'R', id: 'R'},
      {name: 'E', id: 'E'}
    ]
  end
end