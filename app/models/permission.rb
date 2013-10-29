class Permission
  def initialize(user)
    allow_all
    allow :users, [:new, :create, :edit]
    allow :sessions, [:new, :create, :destroy]
    allow :date_app, [:update]
    allow :main, [:index]
    if user
      allow_all if user.admin?
      allow :application, [:change_date]
      allow :users, [:update] do |user_s|
        user_s.id == user.id
      end
      allow :accounts, [:index, :new, :create, :upd_d]
      allow :accounts, [:edit, :update, :destroy] do |account|
        account.user_id == user.id
      end
      allow :type_accounts, [:index, :new, :create]
      allow :type_accounts, [:edit, :update, :destroy] do |type_account|
        type_account.user_id == user.id
      end
      allow :shops, [:index, :new, :create]
      allow :shops, [:edit, :update, :destroy] do |shop|
        shop.user_id == user.id
      end
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource) )
  end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

end