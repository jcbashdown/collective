# -*- coding: UTF-8 -*-

module Entities

  class Box < Entity

    attribute :id, type: Integer
    attribute :title, type: String
    attribute :description, type: String
    #could have something better than array - some kind of lazy enumerable
    attribute :conditions, type: Array
    attribute :documents, type: Array
    #whatever works here
    attribute :open, type: Boolean
    attribute :expires_start_of, type: Date

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :expires_start_of, presence: true

  end

end
