module Admin::ProductsHelper
    def render_formate_description(product)
        simple_format(product.description)
    end
end
