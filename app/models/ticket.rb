class Ticket < ApplicationRecord
	include TicketGenerator

	validates :ticket_title, :ticket_notes, :presence => true
	validates :due_date, inclusion: { in: (Date.today..Date.today+5.years) }
	validates :ticket_number, presence: true, uniqueness: true
end
