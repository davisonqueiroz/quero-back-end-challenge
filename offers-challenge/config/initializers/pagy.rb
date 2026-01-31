require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :empty_page
Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:max_items] = 100