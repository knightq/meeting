module MeetingsHelper
  def meeting_table(options = {}, &block)
    #raise(ArgumentError, "No year given")  unless options.has_key?(:year)
    #raise(ArgumentError, "No month given") unless options.has_key?(:month)

    block ||= Proc.new {|d| nil}

    defaults = {
      :table_class => 'meeting_table',
      :proposal_date_class => 'proposal_date',
      :attender_class => 'attender_class',
      :accessible => false,
    }
    options = defaults.merge options

    cal = %(<table class="#{options[:table_class]}" border="1" cellspacing="0" cellpadding="2">)
    cal << %(<thead><tr><th>Partecipanti</th>)
    pdates = @model.proposal_dates
    colspan = pdates.size
    unless pdates
      @model.pdates.each do |pd|
    	cal << %(<th class="#{options[:proposal_date_class]}">#{pd.date}</th>)
      end
    end
    cal << %(</tr><tr>)
    cal << "</tr></thead><tbody>"
    atts = @model.attenders
    atts.each do |att|
      puts #{att.name}
      cal << %(<tr>)
      cal << %(<td class="#{options[:attender_class]}")
      cal << " organizator" if att.organizator?
      cal << %(>#{att.name}</td>)
      cal << %(</tr>)
  end
    cal << %(</tr></tbody></table>)
  end

  def am_i_involved_in?(meeting_id)
    is_involved_in?(@current_user.id, meeting_id)     
  end

  def is_involved_in?(user_id, meeting_id)
    Participation.exists?(:meeting_id => meeting_id, :user_id => user_id)     
  end

  def participants_to(meeting)
   ParticipationsController.participants_to(meeting.id)
  end
  def find_user(user_id)
    User.find(user_id)
  end

  def users_participants_to(meeting)
    ParticipationsController.participants_to(meeting.id).collect {|p| find_user(p.user_id).name }
  end

end
