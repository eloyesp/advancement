# you should use seed_fu (but it is not required)
# require 'seed_fu'

class <%= class_name %>Migration < Advancement::Migration

  Constraints = [:id]

  def build seed
    # here you do your magic
    attributes = {}
    <%- attribute_names.each do |key| -%>
    attributes[:<%= key.underscore %>] = seed[<%= key %>]
    <%- end -%>

    <%= class_name %>.seed Constraints, attributes
  end

end

