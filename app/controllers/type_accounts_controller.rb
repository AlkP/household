class TypeAccountsController < ApplicationController

  def new
    @type_account = TypeAccount.new()
  end

  def index
    current_page_set("type_account")
    @type_accounts = TypeAccount.where(:user_id => current_user.id)
  end

  def create
    @type_account = TypeAccount.new(:name => params[:type_account][:name], :user_id => current_user.id)

    if @type_account.save
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    @type_account = TypeAccount.find(params[:id])
    redirect_to root_url if @type_account.user_id != current_user.id
  end

  def update
    @type_account = TypeAccount.find(params[:id])

    if @type_account.update(type_account_params)
      render 'edit'
    else
      render 'edit'
    end
  end

  def destroy
    @type_account = TypeAccount.find(params[:id])
    @type_account.destroy
    redirect_to type_accounts_path
  end

  private

  def type_account_params
    params.require(:type_account).permit(:name, :user_id)
  end
end
