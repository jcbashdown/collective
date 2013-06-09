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

## Usage

This gem is stuctured according to my own personal interpretation of some kind of approximate conflation of Uncle Bobs EBI architecture and Hexagonal architecture. User actions are organised into use cases and these are the meat of the application business logic. They accept an adapter which implements Collective::RequestAdapter and return a response which responds to persist and respond. The result of persist and respond provide objects which are responsible for driving some kind of persistance adapter responding to Collective::PersistanceAdapter and some kind of response adapter responding to Collective::ResponseAdapter.

This might work with Rails in the following controller action.

BoxController < ActionController::Base

"The EBI side has the logic: what stuff needs what kind of security and when and how. The Rails knows nothing about this, it request what to do from the EBI side and or the EBI side request the Rails side to act."

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
