class TypeAccountsController < ApplicationController

  def new
    @type_account = TypeAccount.new()
  end

  def index
    current_page_set("type_account")
    #@type_accounts = TypeAccount.where(:user_id => current_user.id)
    @type_accounts = my_type_accounts
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
    @type_account = current_resource
    #redirect_to root_url if @type_account.user_id != current_user.id
  end

  def update
    if params[:type_account][:main] == "1"
      @all_type_accounts =  my_type_accounts
      @all_type_accounts.update_all( :main => false )
    end
    @type_account = current_resource

    if @type_account.update(type_account_params)
      redirect_to type_accounts_path
    else
      render 'edit'
    end
  end

  def destroy
    @type_account = current_resource
    @type_account.destroy
    redirect_to type_accounts_path
  end

  private

  def my_type_accounts
    TypeAccount.my_all(current_user)
  end

  def type_account_params
    params.require(:type_account).permit(:name, :main, :user_id)
  end

  def current_resource
    @current_resource ||= TypeAccount.find(params[:id]) if params[:id]
  end

end
