module ApplicationHelper

    def full_title(page_title)
        # base_title = "湖南大学 电子义务维修基地"
        base_title = "例程"

        if page_title.empty?
            base_title
        else
            base_title + ' || ' + page_title.to_s
        end
    end
end
