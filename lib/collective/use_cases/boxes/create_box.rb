# -*- coding: UTF-8 -*-

module Collective
  module UseCases

    class CreateBox < ::UseCases::UseCase

      def exec
        box = Entities::Box.new(request)

        if box.valid?
          db[box].save
          Response.new(box: box)
        else
          Response.new(box: box, errors: box.errors)
        end
      end

    end

  end
end
