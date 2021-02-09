module AvantUtils
  module Bootstrap
    class NavbarNavigation
      delegate :tag, :link_to, :safe_join, to: :helpers

      def initialize
        @items = []
      end

      def render
        tag.ul class: 'navbar-nav' do
          render_items
        end
      end

      def dropdown(title)
        item = Dropdown.new(title)
        yield item
        @items << item
        nil
      end

      private

      def render_items
        safe_join @items.map(&:render)
      end

      def helpers
        ApplicationController.helpers
      end

      class Dropdown
        delegate :tag, :link_to, :safe_join, to: :helpers

        def initialize(title)
          @title = title
          @items = []
        end

        def item(title, path)
          @items << link_to(title, path, class: 'dropdown-item')
          nil
        end

        def divider
          @items << tag.div(class: 'dropdown-divider')
          nil
        end

        def render
          organize_dropdown_dividers

          return if @items.empty?

          tag.li class: 'nav-item dropdown' do
            render_nav_link + render_dropdown_menu
          end
        end

        private

        def render_nav_link
          link_to @title, 'javascript:void(0)', class: 'nav-link dropdown-toggle', id: dropdown_id, role: 'button',
                                                data: { toggle: 'dropdown' }, aria: { haspopup: true, expanded: false }
        end

        def render_dropdown_menu
          tag.div class: 'dropdown-menu', aria: { labelledby: dropdown_id } do
            safe_join @items
          end
        end

        def dropdown_id
          @dropdown_id ||= "#{@title.parameterize}-dropdown"
        end

        def organize_dropdown_dividers
          # o divider não deve ser incluído se:
          # - está na primeira posição;
          # - o item anterior é um divider;
          # - não existem itens após o divider.
          last_is_an_item = nil

          @items.select! do |item|
            current_is_an_item = item.include? 'dropdown-item'
            (current_is_an_item || last_is_an_item).tap do
              last_is_an_item = current_is_an_item
            end
          end

          @items.pop unless last_is_an_item
        end

        def helpers
          ActionController::Base.helpers
        end
      end
    end
  end
end
