module TagsHelper

  def display_tags(object_with_tags)
    if object_with_tags.tags.any?
      content_tag :span do
        object_with_tags.tags.each do |tag|
          concat content_tag(:span, tag.name, class: "label label-success margin-horizontal-5")
        end
      end
    end
  end

  def display_tools(project)
    if project.tools.any?
      content_tag :span do
        project.tools.each do |tool|
          concat content_tag(:span, tool.name, class: "label label-info margin-horizontal-5")
        end
      end
    end
  end

end
