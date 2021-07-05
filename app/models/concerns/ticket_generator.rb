module TicketGenerator
  extend ActiveSupport::Concern

  class_methods do
    def today_last_ticket(date)
      where("ticket_number LIKE ?", "#{date}-%").last
    end
  end

  included do
    attr_reader :last_ticket

    before_create :ensure_ticket_number

    private 

    def ensure_ticket_number
      self.ticket_number = last_ticket.nil? ?  generate_new_number : generate_inc_number
    end

    def generate_inc_number
      incr_num = last_ticket.ticket_number.split('-').last.to_i + 1
      current_date + ('-%.3i' %incr_num)
    end

    def generate_new_number
      current_date + ('-%.3i' %1) unless last_ticket
    end

    def last_ticket
      @last_ticket = Ticket.today_last_ticket(current_date)
    end

    def current_date
      Date.today.strftime("%Y-%m-%d")
    end
  end
end
