# Collective

Collective is a tool for managing and solving collective action problems. Have a public good you want to provide but want to minimise free riders? Use Collective. Have a group of people with a secret which no one wants to share alone? Use Collective.

Collective functions as a secure Dropbox for digitally signed documents and money held in escrow. When you have a collective action problem to solve you start a new box and set conditions on it's execution. This could be a certain amount of money or a certain number of people signing up. Once the conditions are met, the box is opened and any contracts, now with a full list of signatories, can be executed. Money can be disbursed and documents can be made public.

## Installation

Add this line to your application's Gemfile:

    gem 'collective'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collective

## How it works/Usage

This gem is stuctured according to my own personal interpretation of some kind of approximate conflation of Uncle Bobs EBI architecture and Hexagonal architecture with a reliance on the library used in the Guru Watch example application at git://github.com/qertoip/guru_watch.git. User actions are organised into use cases and these are the meat of the application business logic. They accept a request (an openstruct) or hash, implement the abstract UseCase class (found in the Guru Watch library) and return a response. When use cases are called you must ensure a back end has been configured which implements the RubyPersistanceApi::Abstract::Backend found in Guru Watch. These can be configured app wide or on a per use case call basis.

This might work with Rails in the following controller action.

BoxController < ActionController::Base

  def create_box
    @box = Collective::UseCases::CreateBox.new(params[:box], optional_db_implementing_adapter).exec
    @box.ok? 
      redirect_to(boxes_path)
    else
      flash[:errors] = @box.errors
      render(:new)
    end
  end

end

The intention is to ensure that, as long as all these abstract classes/adapters are implemented the business logic never need worry about what is driving it and how it is persisting things.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
