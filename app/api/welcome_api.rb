class WelcomeApi < Grape::API
  resource :welcome do
    desc 'Welcome endpoint'

    get do
      { title: I18n.t('api.welcome.title'),
        message: I18n.t('api.welcome.message') }
    end
  end
end
