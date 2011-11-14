module HomeworkHelper
  def format_status(some_status)
    map = { "Closed" => "Cerrado", "Open" => "Abierto" }
    map[some_status].present? ? map[some_status] : some_status
  end
end
