module ApplicationHelper

  def dashboard
    @my_type_accounts = my_type_accounts
    @my_type_accounts_sum = {}
    @my_type_accounts.each do |f|
      @my_type_accounts_sum[f.name] = account_my_all_by_type(f.id)
    end
  end

  private
  def my_type_accounts
    TypeAccount.my_all(current_user)
  end

  def account_my_all_by_type(id)
    Account.my_all_by_type(current_user, id).sum('amount')
  end

end
