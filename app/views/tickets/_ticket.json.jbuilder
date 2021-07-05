json.extract! ticket, :id, :ticket_title, :ticket_number, :due_date, :ticket_notes, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
