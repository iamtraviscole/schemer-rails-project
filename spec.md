# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Color Schemes have many Colors)
- [x] Include at least one belongs_to relationship (Color Schemes belong to Users)
- [x] Include at least one has_many through relationship (Color Schemes have many Colors through Color Scheme Colors)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (Colors have a hex code)
- [x] Include reasonable validations for simple model objects (User and Color Scheme validations)
- [x] Include a class level ActiveRecord scope method (FavoriteColorScheme.most_popular URL: /popular)
- [x] Include a nested form writing to an associated model using a custom attribute writer (/users/1/color_schemes/new)
- [x] Include signup (Created my own)
- [x] Include login (Created my own)
- [x] Include logout (Created my own)
- [x] Include third party signup/login (OmniAuth Github)
- [x] Include nested resource show or index (/users/1/color_schemes)
- [x] Include nested resource "new" form (/users/1/color_schemes/new)
- [x] Include form display of validation errors (/signup)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
