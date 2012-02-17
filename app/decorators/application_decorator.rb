#encoding: utf-8
class ApplicationDecorator < Draper::Base
  def localize_date(datefield)
    h.l datefield
  end

  def handle_none(value, message=" - ", wrap="span")
    if value.present?
      yield
    else
      if wrap
        h.content_tag wrap, message, class: "none"
      else
        message
      end
    end
  end

  def twipsy(value)
    h.content_tag :a, h.truncate(value, length: 20),
      href: "#", rel: "tooltip",
      "data-original-title" => value
  end
end
