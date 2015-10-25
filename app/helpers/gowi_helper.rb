module GowiHelper
  def stars_html(number)
    full_stars = number.to_i / 2
    half_star = (number % 2) > 0

    final_string = []

    (1..full_stars).each do |i|
      final_string << "<span class='fa fa-star'></span>"
    end

    final_string << "<span class='fa fa-star-half-full'></span>" if half_star

    (final_string.length..4).each do |i|
      final_string << "<span class='fa fa-star-o'></span>"
    end

    final_string = final_string.join("").html_safe
  end

end