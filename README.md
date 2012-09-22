# Omniauth::Vpsa

Gem criada para facilitar a integração com as API's do VPSA

## Instalação

Adicione a seguinte linha ao seu Gemfile:

    gem 'omniauth-vpsa'

E execute:

    $ bundle

Ou instale de acordo com o comando abaixo:

    $ gem install omniauth-vpsa

## Como usar

Crie o arquivo app_root/config/initializers/omniauth.rb com o seguinte conteudo:

	Rails.application.config.middleware.use OmniAuth::Builder do
	  provider :vpsa, "app_id", "app_secret",  {
	    redirect_uri:'http://localhost:3000/auth/vpsa/callback'
	  }
	end

Configure a rota no arquivo routes.rb

	match '/auth/:provider/callback', to: 'sessions#create'

Crie o controller que servirá como callback para o processo de autenticação

Para acessar os dados do usuário utilize o seguinte código:

	request.env['omniauth.auth']

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
