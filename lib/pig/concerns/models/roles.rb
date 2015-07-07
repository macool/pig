module Pig
  module Concerns
    module Models
      module Roles

        extend ::ActiveSupport::Concern

        included do
          scope :role_is,
            lambda {|role| base.where('role IN (?)', [*role].collect(&:to_s)) }
        end

        module ClassMethods
          def has_roles(*args)
            args.each do |role|
              define_method("#{role}?") do
                role_is?(role)
              end
            end
          end
        end

        def admin?
          role_is?(:admin)
        end
        alias_method :is_admin?, :admin?

        def role_is?(role_type)
          role.present? && [*role_type].collect(&:to_s).include?(role)
        end

      end
    end
  end
end
