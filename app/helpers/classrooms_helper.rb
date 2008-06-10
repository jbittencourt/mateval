module ClassroomsHelper
  def select_year(distinct_years)
    "Ano " + select("classroom", "year", distinct_years)
  end
end
